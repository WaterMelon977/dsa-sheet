'use client';

import React from 'react';
import Link from 'next/link';
import { useProgress } from '@/context/ProgressContext';

export default function UserProgressBanner() {
    const { topics, solvedProblemIds, user, isLoading: progressLoading } = useProgress();

    // Calculate stats instantly whenever topics or solvedProblemIds change
    let totalPatterns = 0;
    let exploredPatterns = 0;

    topics.forEach(topic => {
        (topic.patterns || []).forEach(pattern => {
            totalPatterns++;
            const hasSolvedProblem = (pattern.problems || []).some(p => solvedProblemIds.has(p.id));
            if (hasSolvedProblem) {
                exploredPatterns++;
            }
        });
    });

    const percentage = totalPatterns > 0 ? (exploredPatterns / totalPatterns) * 100 : 0;

    if (progressLoading) {
        return (
            <div className="w-full max-w-3xl mx-auto mb-12 animate-pulse">
                <div className="h-24 clay-card w-full"></div>
            </div>
        );
    }

    if (!user) {
        return (
            <div className="w-full max-w-3xl mx-auto mb-12">
                <div className="clay-card p-6 text-center border-dashed border-zinc-700 hover:border-cyan-500/50 transition-colors group">
                    <p className="text-zinc-400 mb-2 font-sans group-hover:text-zinc-300 transition-colors">
                        Take your journey to the next level.
                    </p>
                    <Link href="/login" className="text-cyan-400 hover:text-cyan-300 font-medium transition-colors">
                        Login to track your progress &rarr;
                    </Link>
                </div>
            </div>
        );
    }

    return (
        <div className="w-full max-w-3xl mx-auto mb-12">
            <div className="clay-card p-8 relative overflow-hidden group">
                {/* Subtle glow effect */}
                <div className="absolute -top-24 -left-24 w-48 h-48 bg-cyan-500/10 rounded-full blur-3xl group-hover:bg-cyan-500/20 transition-all duration-700"></div>

                <div className="relative z-10">
                    <h2 className="text-2xl md:text-3xl font-serif text-white mb-2 leading-snug">
                        Hi <span className="text-cyan-400">{user.username}</span>,
                        you have explored <span className="text-emerald-400">{exploredPatterns}</span> patterns from <span className="text-zinc-300">{totalPatterns}</span> patterns
                    </h2>

                    <div className="mt-6">
                        <div className="flex justify-between items-end mb-2">
                            <span className="text-sm font-medium text-zinc-500">Distance completed</span>
                            <span className="text-sm font-bold text-emerald-400">{Math.round(percentage)}%</span>
                        </div>
                        <div className="h-3 w-full bg-black/40 rounded-full overflow-hidden border border-white/5 p-[1px]">
                            <div
                                className="h-full bg-gradient-to-r from-emerald-600 to-emerald-400 rounded-full transition-all duration-1000 ease-out shadow-[0_0_10px_rgba(52,211,153,0.3)]"
                                style={{ width: `${percentage}%` }}
                            ></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
