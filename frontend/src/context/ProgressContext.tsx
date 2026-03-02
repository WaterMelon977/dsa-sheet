'use client';

import React, { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react';
import { useRouter } from 'next/navigation';

import { Topic, Pattern, Problem, UserProfile } from '../types/roadmap';
import { STATIC_CONTENT } from '../components/content';

interface ProgressContextType {
    topics: Topic[];
    solvedProblemIds: Set<number>;
    user: UserProfile | null;
    isLoading: boolean;
    error: string;
    markSolved: (problemId: number) => Promise<void>;
    unmarkSolved: (problemId: number) => Promise<void>;
    pendingIds: Set<number>;
    logout: () => void;
}

const ProgressContext = createContext<ProgressContextType | undefined>(undefined);

const API = process.env.NEXT_PUBLIC_API_BASE;

export function ProgressProvider({ children }: { children: ReactNode }) {
    const router = useRouter();
    const [topics, setTopics] = useState<Topic[]>(STATIC_CONTENT);
    const [solvedProblemIds, setSolvedProblemIds] = useState<Set<number>>(new Set());
    const [user, setUser] = useState<UserProfile | null>(null);
    const [isLoading, setIsLoading] = useState(false); // topics are static, so no initial loading
    const [error, setError] = useState('');
    const [pendingIds, setPendingIds] = useState<Set<number>>(new Set());

    const getAuthHeaders = useCallback((): HeadersInit => {
        const token = localStorage.getItem("token");
        return token ? { "Authorization": `Bearer ${token}` } : {};
    }, []);

    const logout = useCallback(() => {
        localStorage.removeItem('token');
        setUser(null);
        setSolvedProblemIds(new Set());
    }, []);

    // Load cache on mount (Client-only)
    useEffect(() => {
        const cached = localStorage.getItem("roadmap_content_cache");
        if (cached) {
            try {
                const parsed = JSON.parse(cached);
                if (Array.isArray(parsed) && parsed.length > 0) {
                    setTopics(parsed);
                }
            } catch (e) {
                console.error("Failed to parse cached roadmap content");
            }
        }
    }, []);

    // 1. Initial Content, Progress & Profile Load
    useEffect(() => {
        const fetchData = async () => {
            const token = localStorage.getItem("token");

            // Only fetch content if we don't have enough topics from cache/static
            // Use a specific check if needed, otherwise rely on the initial fetch logic
            const shouldFetchContent = topics === STATIC_CONTENT;

            if (shouldFetchContent) {
                try {
                    const res = await fetch(`${API}/content`).catch(() => null);
                    if (res && res.ok) {
                        const data = await res.json();
                        const sorted = (data as Topic[])
                            .sort((a, b) => a.orderIndex - b.orderIndex)
                            .map(t => ({
                                ...t,
                                patterns: (t.patterns || [])
                                    .sort((a, b) => a.orderIndex - b.orderIndex)
                                    .map(p => ({ ...p, problems: p.problems || [] }))
                            }));
                        setTopics(sorted);
                        localStorage.setItem("roadmap_content_cache", JSON.stringify(sorted));
                    }
                } catch (err) {
                    console.error("Failed to fetch content from API, using static/cache", err);
                } finally {
                    setIsLoading(false);
                }
            } else {
                // We have topics (static or cache), so we are not loading.
                setIsLoading(false);
            }

            // Handle User Progress & Profile in background (non-blocking)
            if (token) {
                // Fetch Progress
                fetch(`${API}/api/roadmap/progress`, { headers: { "Authorization": `Bearer ${token}` } })
                    .catch(() => null) // Suppress loud fetch failures
                    .then(res => res && res.ok ? res.json() : null)
                    .then(data => {
                        if (data && Array.isArray(data.solvedProblemIds)) {
                            setSolvedProblemIds(new Set<number>(data.solvedProblemIds));
                        }
                    })
                    .catch(err => { /* Silent fallback */ });

                // Fetch Profile
                fetch(`${API}/api/me`, { headers: { "Authorization": `Bearer ${token}` } })
                    .catch(() => null) // Suppress loud fetch failures
                    .then(res => {
                        if (res && res.status === 401) {
                            logout();
                            return null;
                        }
                        return res && res.ok ? res.json() : null;
                    })
                    .then(data => {
                        if (data) setUser(data);
                    })
                    .catch(err => { /* Silent fallback */ });
            }
        };

        fetchData();
    }, [topics.length, logout]);

    // 2. Optimistic Solve
    const markSolved = useCallback(async (problemId: number) => {
        const token = localStorage.getItem("token");
        if (!token) {
            router.push('/login');
            return;
        }

        setSolvedProblemIds(prev => {
            const next = new Set(prev);
            next.add(problemId);
            return next;
        });

        setPendingIds(prev => new Set(prev).add(problemId));

        try {
            const res = await fetch(`${API}/api/problems/${problemId}/solve`, {
                method: "POST",
                headers: getAuthHeaders(),
            });
            if (!res.ok) throw new Error("Failed to mark problem as solved.");
        } catch (err: any) {
            setError(err.message || 'Operation failed');
            setSolvedProblemIds(prev => {
                const next = new Set(prev);
                next.delete(problemId);
                return next;
            });
        } finally {
            setPendingIds(prev => {
                const next = new Set(prev);
                next.delete(problemId);
                return next;
            });
        }
    }, [router, getAuthHeaders]);

    // 3. Optimistic Unsolve
    const unmarkSolved = useCallback(async (problemId: number) => {
        const token = localStorage.getItem("token");
        if (!token) {
            router.push('/login');
            return;
        }

        setSolvedProblemIds(prev => {
            const next = new Set(prev);
            next.delete(problemId);
            return next;
        });

        setPendingIds(prev => new Set(prev).add(problemId));

        try {
            const res = await fetch(`${API}/api/problems/${problemId}/solve`, {
                method: "DELETE",
                headers: getAuthHeaders(),
            });
            if (!res.ok && res.status !== 204) throw new Error("Failed to unmark problem.");
        } catch (err: any) {
            setError(err.message || 'Operation failed');
            setSolvedProblemIds(prev => {
                const next = new Set(prev);
                next.add(problemId);
                return next;
            });
        } finally {
            setPendingIds(prev => {
                const next = new Set(prev);
                next.delete(problemId);
                return next;
            });
        }
    }, [router, getAuthHeaders]);

    return (
        <ProgressContext.Provider value={{ topics, solvedProblemIds, user, isLoading, error, markSolved, unmarkSolved, pendingIds, logout }}>
            {children}
        </ProgressContext.Provider>
    );
}

export function useProgress() {
    const context = useContext(ProgressContext);
    if (!context) throw new Error("useProgress must be used within a ProgressProvider");
    return context;
}
