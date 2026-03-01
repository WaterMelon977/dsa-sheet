'use client';

import React from 'react';
import Link from 'next/link';
import { useProgress } from '@/context/ProgressContext';

export default function UserProgressBanner() {
    const { topics, solvedProblemIds, user, isLoading } = useProgress();

    let totalPatterns = 0;
    let exploredPatterns = 0;

    topics.forEach(topic => {
        (topic.patterns || []).forEach(pattern => {
            totalPatterns++;
            const hasSolvedProblem = (pattern.problems || []).some(p => solvedProblemIds.has(p.id));
            if (hasSolvedProblem) exploredPatterns++;
        });
    });

    const percentage = totalPatterns > 0 ? (exploredPatterns / totalPatterns) * 100 : 0;
    const roundedPercent = Math.round(percentage);

    const getTier = (pct: number) => {
        if (pct <= 10) return { name: 'Explorer', emoji: '🧭' };
        if (pct <= 25) return { name: 'Voyager', emoji: '🚀' };
        if (pct <= 40) return { name: 'Pathfinder', emoji: '🗺️' };
        if (pct <= 55) return { name: 'Warrior', emoji: '⚔️' };
        if (pct <= 70) return { name: 'Champion', emoji: '🏆' };
        if (pct <= 85) return { name: 'Legend', emoji: '🌟' };
        return { name: 'Conqueror', emoji: '👑' };
    };

    const currentTier = getTier(percentage);

    if (isLoading) {
        return (
            <div className="w-full max-w-4xl mx-auto mb-16 animate-pulse px-4">
                <div className="h-40 glass-card w-full glass-mesh border-white/5" />
            </div>
        );
    }

    if (!user) {
        return (
            <div className="w-full max-w-4xl mx-auto mb-16 px-4">
                <div className="glass-card glass-mesh glass-shine px-8 py-6 flex flex-col md:flex-row items-center justify-between gap-6 overflow-hidden">
                    <div className="flex flex-col gap-1 text-center md:text-left">
                        <h3 className="text-xl font-serif text-white/90">Authentication Required</h3>
                        <p className="text-sm text-zinc-500 font-light max-w-xs">
                            Login to persist your solve history and visualize your pattern mastery journey.
                        </p>
                    </div>
                    <Link
                        href="/login"
                        className="glass-pill-active text-sm font-semibold text-cyan-300 px-8 py-3 whitespace-nowrap transition-all hover:scale-105 active:scale-95 shadow-cyan-500/20 shadow-xl"
                    >
                        Sign In Now →
                    </Link>
                </div>
            </div>
        );
    }

    return (
        <div className="w-full max-w-4xl mx-auto mb-16 px-4">
            <div className="glass-card glass-mesh glass-shine overflow-hidden group">
                {/* ── Background Flair ── */}
                <div className="absolute top-0 right-0 w-64 h-64 bg-emerald-500/5 blur-[100px] pointer-events-none translate-x-1/2 -translate-y-1/2 group-hover:bg-emerald-500/10 transition-colors duration-700" />

                <div className="relative z-10 p-8 md:p-10 flex flex-col md:flex-row items-center gap-10">

                    {/* ── Left Column: Greeting & Stats ── */}
                    <div className="flex-1 space-y-6">
                        <div className="space-y-2 text-center md:text-left">
                            <h2 className="text-2xl md:text-3xl font-serif text-white/95 leading-tight tracking-tight">
                                Welcome back, <br className="hidden md:block" />
                                <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-violet-400 to-emerald-400 font-bold">
                                    {user.username}
                                </span>
                            </h2>
                            <p className="text-sm md:text-base text-zinc-400 font-light leading-relaxed">
                                You have conquered <span className="text-emerald-400 font-medium">{exploredPatterns}</span> of <span className="text-zinc-200 font-medium">{totalPatterns}</span> dsa patterns.
                            </p>
                        </div>

                        {/* Labels row */}
                        <div className="flex flex-wrap items-center justify-center md:justify-start gap-4">
                            <div className="glass-pill px-5 py-2 inline-flex items-center gap-3 text-[11px] uppercase tracking-widest text-zinc-500 font-bold border-white/5">
                                <span>Current Tier :</span>
                                <span className="text-amber-400 flex items-center gap-2">
                                    {currentTier.name}
                                    <span className="text-4xl leading-none mb-2">{currentTier.emoji}</span>
                                </span>
                            </div>
                        </div>
                    </div>

                    {/* ── Right Column: Visual Progress Meter ── */}
                    <div className="relative shrink-0 flex items-center justify-center w-40 h-40">
                        {/* Decorative background ring */}
                        <svg className="absolute w-full h-full -rotate-90" viewBox="0 0 100 100">
                            <defs>
                                <linearGradient id="gaugeGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                                    <stop offset="0%" stopColor="#22d3ee" />
                                    <stop offset="50%" stopColor="#818cf8" />
                                    <stop offset="100%" stopColor="#34d399" />
                                </linearGradient>
                            </defs>
                            <circle
                                cx="50" cy="50" r="48"
                                className="fill-none stroke-white/5"
                                strokeWidth="4"
                            />
                            <circle
                                cx="50" cy="50" r="48"
                                className="fill-none transition-all duration-1000 ease-out"
                                strokeWidth="4"
                                strokeLinecap="round"
                                strokeDasharray="301.59"
                                strokeDashoffset={301.59 - (301.59 * percentage) / 100}
                                style={{ stroke: 'url(#gaugeGradient)' }}
                            />
                        </svg>

                        {/* Large percent display */}
                        <div className="flex flex-col items-center">
                            <span className="text-5xl font-serif font-bold text-white tabular-nums tracking-tighter">
                                {roundedPercent}<span className="text-lg text-white/40 ml-0.5">%</span>
                            </span>
                            <span className="text-[10px] uppercase tracking-[0.2em] font-bold text-zinc-500 -mt-1">Mastery</span>
                        </div>
                    </div>
                </div>

                {/* ── Bottom Bar: Edge Shine ── */}
                <div className="h-1 w-full relative bg-white/5">
                    <div
                        className="h-full premium-gradient-emerald transition-all duration-1000 ease-out"
                        style={{ width: `${percentage}%` }}
                    />
                </div>
            </div>
        </div>
    );
}
