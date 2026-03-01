'use client';

import React, { useState, useCallback, useEffect } from 'react';
import { useProgress, Topic, Pattern } from '@/context/ProgressContext';

export default function RoadmapViewer() {
    const { topics, solvedProblemIds, isLoading, markSolved, unmarkSolved, pendingIds, error } = useProgress();
    const [selectedTopic, setSelectedTopic] = useState<Topic | null>(null);
    const [selectedPattern, setSelectedPattern] = useState<Pattern | null>(null);

    // Lock body scroll when overlay is open
    useEffect(() => {
        if (selectedTopic) {
            document.body.style.overflow = 'hidden';
        } else {
            document.body.style.overflow = 'unset';
        }
        // Cleanup on unmount
        return () => { document.body.style.overflow = 'unset'; };
    }, [selectedTopic]);

    const handleMarkSolved = useCallback(async (e: React.MouseEvent, problemId: number) => {
        e.preventDefault();
        e.stopPropagation();
        await markSolved(problemId);
    }, [markSolved]);

    const handleUnsolve = useCallback(async (e: React.MouseEvent, problemId: number) => {
        e.preventDefault();
        e.stopPropagation();
        await unmarkSolved(problemId);
    }, [unmarkSolved]);

    if (isLoading) {
        return (
            <div className="flex justify-center items-center py-24">
                <div className="w-12 h-12 border-[3px] border-white/5 border-t-cyan-500 rounded-full animate-spin shadow-[0_0_20px_rgba(34,211,238,0.2)]" />
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center text-rose-400 py-12 glass-card glass-mesh p-10 max-w-lg mx-auto border-rose-500/20">
                <p className="text-lg font-serif mb-2">Something went wrong</p>
                <p className="text-sm opacity-60 font-light">{error}</p>
            </div>
        );
    }

    return (
        <>
            {/* ── Topics List ─────────────────────────────────────────── */}
            <div className="flex flex-col items-center w-full max-w-xl mx-auto mb-20">
                {topics.map((topic, index) => {
                    const totalPatterns = topic.patterns?.length ?? 0;
                    const exploredPatterns = topic.patterns.filter(p =>
                        (p.problems || []).some(prob => solvedProblemIds.has(prob.id))
                    ).length;

                    const isCompleted = totalPatterns > 0 && exploredPatterns === totalPatterns;
                    const progressPercent = totalPatterns > 0 ? (exploredPatterns / totalPatterns) * 100 : 0;

                    return (
                        <React.Fragment key={topic.id}>
                            <div
                                onClick={() => setSelectedTopic(topic)}
                                className={`glass-card glass-mesh glass-shine w-full px-8 py-10 cursor-pointer flex flex-col items-center text-center group transition-all duration-500 hover:scale-[1.02] active:scale-[0.98] opacity-0 animate-staggered ${isCompleted ? 'border-amber-500/30' : ''
                                    }`}
                                style={{ animationDelay: `${index * 120}ms` }}
                            >
                                {/* Achievement state */}
                                {isCompleted && (
                                    <div className="mb-4 glass-pill px-3 py-1 text-[10px] font-bold uppercase tracking-widest text-amber-400 border-amber-500/20 shadow-[0_0_15px_rgba(251,191,36,0.1)]">
                                        ★ Phase Mastered ★
                                    </div>
                                )}

                                <h3 className={`text-xl md:text-2xl font-serif leading-tight tracking-tight mb-6 transition-all duration-300 ${isCompleted ? 'text-amber-200' : 'text-white/95 group-hover:text-cyan-300'
                                    }`}>
                                    {topic.name}
                                </h3>

                                {/* Crystal Progress Engine */}
                                <div className="w-full max-w-[340px] mb-4">
                                    <div className="h-3 w-full rounded-full bg-black/40 border border-white/5 overflow-hidden p-[1.5px] shadow-inner">
                                        <div
                                            className={`h-full rounded-full transition-all duration-1000 ease-out ${isCompleted ? 'bg-gradient-to-r from-amber-600 to-amber-400 shadow-[0_0_20px_rgba(251,191,36,0.3)]' : 'premium-gradient-emerald'
                                                }`}
                                            style={{ width: `${progressPercent}%` }}
                                        />
                                    </div>
                                </div>

                                <div className={`text-sm font-medium tabular-nums tracking-wide ${isCompleted ? 'text-amber-500' : 'text-zinc-500'
                                    }`}>
                                    <span className={isCompleted ? 'text-amber-300' : 'text-zinc-300'}>{exploredPatterns}</span>
                                    <span className="mx-1.5 opacity-40">/</span>
                                    {totalPatterns}
                                    <span className="ml-2 lowercase font-light opacity-60">patterns</span>
                                </div>
                            </div>

                            {/* Flow Connector */}
                            {index < topics.length - 1 && (
                                <div className="h-16 flex justify-center w-full">
                                    <div className="w-[1.5px] h-full bg-gradient-to-b from-white/10 to-transparent" />
                                </div>
                            )}
                        </React.Fragment>
                    );
                })}
            </div>

            {/* ── Spatial Overlay ─────────────────────────────────────── */}
            {selectedTopic && (
                <div
                    className="fixed inset-0 z-50 flex items-center justify-center p-4 cursor-pointer"
                    style={{ background: 'rgba(0,0,0,0.7)', backdropFilter: 'blur(20px) saturate(160%)' }}
                    onClick={() => { setSelectedTopic(null); setSelectedPattern(null); }}
                >
                    <div
                        className="glass-panel glass-mesh w-full max-w-2xl h-[75vh] p-6 md:p-10 flex flex-col relative overflow-hidden cursor-default shadow-2xl scale-100 animate-staggered"
                        onClick={(e) => e.stopPropagation()}
                    >
                        {/* Corner Glow */}
                        <div className="absolute -top-20 -right-20 w-40 h-40 bg-cyan-500/10 blur-[60px]" />

                        <div className="mb-8">
                            <div className="text-xs font-bold text-zinc-500 mb-4 flex flex-wrap gap-2 items-center tracking-[0.15em] uppercase">
                                <button
                                    onClick={() => setSelectedPattern(null)}
                                    className={`transition-all hover:tracking-[0.2em] ${selectedPattern ? 'hover:text-cyan-400 cursor-pointer text-zinc-400' : 'text-cyan-400 cursor-default'}`}
                                >
                                    {selectedTopic.name}
                                </button>
                                {selectedPattern && (
                                    <>
                                        <span className="text-zinc-800 font-normal">/</span>
                                        <span className="text-cyan-400">{selectedPattern.name}</span>
                                    </>
                                )}
                            </div>
                            <h2 className="text-xl md:text-2xl font-serif text-white tracking-tight leading-tight">
                                {selectedPattern ? selectedPattern.name : selectedTopic.name}
                            </h2>
                        </div>

                        <div className="overflow-y-auto flex-1 pr-2 space-y-4 custom-scrollbar">
                            {!selectedPattern ? (
                                selectedTopic.patterns.map((pattern, idx) => {
                                    const patternSolved = (pattern.problems || []).filter(p => solvedProblemIds.has(p.id)).length;
                                    const allSolved = patternSolved === (pattern.problems?.length ?? 0) && patternSolved > 0;

                                    return (
                                        <div
                                            key={pattern.id}
                                            onClick={() => setSelectedPattern(pattern)}
                                            className="glass-card glass-shine px-6 py-4 cursor-pointer flex flex-col sm:flex-row justify-between sm:items-center gap-4 group opacity-0 animate-staggered"
                                            style={{ animationDelay: `${idx * 40}ms` }}
                                        >
                                            <div className="space-y-1">
                                                <span className={`font-medium text-base leading-snug block transition-colors ${allSolved ? 'text-emerald-300' : 'text-zinc-100 group-hover:text-cyan-300'
                                                    }`}>
                                                    {pattern.name}
                                                </span>
                                                {/* <p className="text-xs text-zinc-500 font-light tracking-wide">
                                                    Technique-driven analysis
                                                </p> */}
                                            </div>
                                            <div className="flex items-center gap-3">
                                                <span className={`text-xs font-bold px-3 py-1 rounded-full ${allSolved ? 'bg-emerald-400/10 text-emerald-400 border border-emerald-400/20' : 'glass-pill text-zinc-400'
                                                    }`}>
                                                    {patternSolved} / {pattern.problems?.length || 0}
                                                </span>
                                                <div className="w-8 h-8 rounded-full glass-pill flex items-center justify-center group-hover:bg-cyan-400/20 group-hover:text-cyan-300 transition-all">
                                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="9 18 15 12 9 6" /></svg>
                                                </div>
                                            </div>
                                        </div>
                                    );
                                })
                            ) : (
                                /* Problems */
                                <>
                                    {[...selectedPattern.problems]
                                        .sort((a, b) => {
                                            const order = { 'EASY': 0, 'MEDIUM': 1, 'HARD': 2 };
                                            const diffA = order[a.difficulty as keyof typeof order] ?? 99;
                                            const diffB = order[b.difficulty as keyof typeof order] ?? 99;
                                            if (diffA !== diffB) return diffA - diffB;
                                            return a.id - b.id;
                                        })
                                        .map((problem, idx) => {
                                            const isSolved = solvedProblemIds.has(problem.id);
                                            const isPending = pendingIds.has(problem.id);
                                            return (
                                                <a
                                                    key={problem.id}
                                                    href={problem.leetcodeUrl}
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                    className={`glass-card glass-shine px-5 py-3 block group transition-all opacity-0 animate-staggered ${isSolved ? '!border-emerald-500/30 bg-emerald-500/[0.02]' : ''
                                                        }`}
                                                    style={{ animationDelay: `${idx * 40}ms` }}
                                                >
                                                    <div className="flex flex-col sm:flex-row justify-between sm:items-center gap-4">
                                                        <div className="flex items-center gap-4 min-w-0">
                                                            <div className={`shrink-0 w-8 h-8 rounded-lg flex items-center justify-center border transition-all ${isSolved ? 'bg-emerald-500/10 border-emerald-500/40 text-emerald-400' : 'bg-white/5 border-white/10 text-zinc-600 group-hover:border-cyan-500/40 group-hover:text-cyan-400'
                                                                }`}>
                                                                {isSolved ? (
                                                                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12" /></svg>
                                                                ) : (
                                                                    <span className="text-[10px] font-bold">{idx + 1}</span>
                                                                )}
                                                            </div>
                                                            <span className={`font-medium text-sm truncate transition-colors ${isSolved ? 'text-emerald-100' : 'text-zinc-200 group-hover:text-white'
                                                                }`}>
                                                                {problem.title}
                                                            </span>
                                                        </div>

                                                        <div className="flex items-center gap-3 shrink-0 self-start sm:self-auto">
                                                            <span className={`text-[10px] font-bold px-3 py-1 rounded-full border tracking-widest uppercase ${problem.difficulty === 'EASY' ? 'text-emerald-400 border-emerald-400/20 bg-emerald-400/5' :
                                                                problem.difficulty === 'MEDIUM' ? 'text-amber-400  border-amber-400/20  bg-amber-400/5' :
                                                                    'text-rose-400   border-rose-400/20   bg-rose-400/5'
                                                                }`}>
                                                                {problem.difficulty}
                                                            </span>

                                                            <div className="flex gap-2">
                                                                {isSolved ? (
                                                                    <button
                                                                        onClick={e => handleUnsolve(e, problem.id)}
                                                                        disabled={isPending}
                                                                        className="glass-pill px-4 py-1.5 text-[10px] font-bold uppercase tracking-wider text-rose-400 hover:bg-rose-500/10 border-rose-500/20 disabled:opacity-40"
                                                                    >
                                                                        {isPending ? 'Working...' : 'Reset'}
                                                                    </button>
                                                                ) : (
                                                                    <button
                                                                        onClick={e => handleMarkSolved(e, problem.id)}
                                                                        disabled={isPending}
                                                                        className="glass-pill-active px-4 py-1.5 text-[10px] font-bold uppercase tracking-wider text-emerald-400 !bg-emerald-400/10 border-emerald-400/30 disabled:opacity-40"
                                                                    >
                                                                        {isPending ? 'Working...' : 'Mark as Solved'}
                                                                    </button>
                                                                )}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            );
                                        })}
                                    {selectedPattern.problems.length === 0 && (
                                        <div className="text-center text-zinc-600 py-16 font-light">No problems available in this module.</div>
                                    )}
                                </>
                            )}
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}
