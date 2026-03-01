'use client';

import React, { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react';
import { useRouter } from 'next/navigation';

export type Problem = {
    id: number;
    title: string;
    difficulty: "EASY" | "MEDIUM" | "HARD";
    difficultyScore: number;
    leetcodeUrl: string;
};

export type Pattern = {
    id: number;
    name: string;
    orderIndex: number;
    problems: Problem[];
};

export type Topic = {
    id: number;
    name: string;
    orderIndex: number;
    patterns: Pattern[];
};

export interface UserProfile {
    username: string;
    email: string;
    avatar: string;
    provider: string;
}

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
    const [topics, setTopics] = useState<Topic[]>([]);
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

            // Try cache first
            const contentCached = localStorage.getItem("roadmap_content_cache");
            if (contentCached) {
                try {
                    setTopics(JSON.parse(contentCached));
                    // Don't set isLoading(false) here if we also expect auth data
                } catch (e) { }
            }

            try {
                const requests: Promise<any>[] = [fetch(`${API}/content`)];

                if (token) {
                    requests.push(fetch(`${API}/api/roadmap/progress`, { headers: { "Authorization": `Bearer ${token}` } }));
                    requests.push(fetch(`${API}/api/me`, { headers: { "Authorization": `Bearer ${token}` } }));
                }

                const responses = await Promise.allSettled(requests);

                // Handle Content
                const contentRes = responses[0];
                if (contentRes.status === 'fulfilled' && contentRes.value.ok) {
                    const data = await contentRes.value.json();
                    const sorted = data
                        .sort((a: Topic, b: Topic) => a.orderIndex - b.orderIndex)
                        .map((t: Topic) => ({
                            ...t,
                            patterns: (t.patterns || [])
                                .sort((a: Pattern, b: Pattern) => a.orderIndex - b.orderIndex)
                                .map((p: Pattern) => ({ ...p, problems: p.problems || [] }))
                        }));
                    setTopics(sorted);
                    localStorage.setItem("roadmap_content_cache", JSON.stringify(sorted));
                }

                if (token) {
                    // Handle Progress
                    const progressRes = responses[1];
                    if (progressRes.status === 'fulfilled' && progressRes.value.ok) {
                        const data = await progressRes.value.json();
                        if (data && Array.isArray(data.solvedProblemIds)) {
                            setSolvedProblemIds(new Set<number>(data.solvedProblemIds));
                        }
                    }

                    // Handle Profile
                    const profileRes = responses[2];
                    if (profileRes.status === 'fulfilled' && profileRes.value.ok) {
                        setUser(await profileRes.value.json());
                    } else if (profileRes.status === 'fulfilled' && profileRes.value.status === 401) {
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
    }, [getAuthHeaders, logout]);

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
