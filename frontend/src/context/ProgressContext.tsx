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
    const [topics, setTopics] = useState<Topic[]>(() => {
        if (typeof window !== 'undefined') {
            const cached = localStorage.getItem("roadmap_content_cache");
            if (cached) {
                try {
                    return JSON.parse(cached);
                } catch (e) {
                    console.error("Failed to parse cached roadmap content");
                }
            }
        }
        return STATIC_CONTENT;
    });
    const [solvedProblemIds, setSolvedProblemIds] = useState<Set<number>>(new Set());
    const [user, setUser] = useState<UserProfile | null>(null);
    const [isLoading, setIsLoading] = useState(true);
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

    // 1. Initial Content, Progress & Profile Load
    useEffect(() => {
        const fetchData = async () => {
            const token = localStorage.getItem("token");

            try {
                const requests: Promise<any>[] = [];

                // Only fetch content if we have none (last resort)
                let contentRequestIndex = -1;
                if (topics.length === 0) {
                    contentRequestIndex = requests.length;
                    requests.push(fetch(`${API}/content`).then(res => res.ok ? res.json() : null));
                }

                if (token) {
                    requests.push(fetch(`${API}/api/roadmap/progress`, { headers: { "Authorization": `Bearer ${token}` } }).then(res => res.ok ? res.json() : null));
                    requests.push(fetch(`${API}/api/me`, { headers: { "Authorization": `Bearer ${token}` } }).then(res => res.ok ? res.json() : null));
                }

                if (requests.length === 0) {
                    setIsLoading(false);
                    return;
                }

                const results = await Promise.allSettled(requests);

                // Handle Content if requested
                if (contentRequestIndex !== -1) {
                    const contentRes = results[contentRequestIndex];
                    if (contentRes.status === 'fulfilled' && contentRes.value) {
                        const data = contentRes.value as Topic[];
                        const sorted = data
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
                }

                if (token) {
                    const offset = contentRequestIndex !== -1 ? 1 : 0;
                    // Handle Progress
                    const progressRes = results[offset];
                    if (progressRes.status === 'fulfilled' && progressRes.value) {
                        const data = progressRes.value;
                        if (data && Array.isArray(data.solvedProblemIds)) {
                            setSolvedProblemIds(new Set<number>(data.solvedProblemIds));
                        }
                    }

                    // Handle Profile
                    const profileRes = results[offset + 1];
                    if (profileRes.status === 'fulfilled' && profileRes.value) {
                        setUser(profileRes.value);
                    } else if (profileRes.status === 'fulfilled' && !profileRes.value) {
                        // Check if it was a 401
                        logout();
                    }
                }
            } catch (err) {
                console.error("Combined fetch error:", err);
            } finally {
                setIsLoading(false);
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
