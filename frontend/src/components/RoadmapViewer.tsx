'use client';

import React, { useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { useProgress, Topic, Pattern, Problem } from '@/context/ProgressContext';

export default function RoadmapViewer() {
    const router = useRouter();
    const { topics, solvedProblemIds, isLoading, markSolved, unmarkSolved, pendingIds, error } = useProgress();
    const [selectedTopic, setSelectedTopic] = useState<Topic | null>(null);
    const [selectedPattern, setSelectedPattern] = useState<Pattern | null>(null);

    // ── 3. Mark a problem solved ─────────────────────────────────────────
    const handleMarkSolved = useCallback(async (e: React.MouseEvent, problemId: number) => {
        e.preventDefault(); // stop the <a> tag from navigating
        e.stopPropagation();
        await markSolved(problemId);
    }, [markSolved]);

    // ── 4. Unsolve a problem ──────────────────────────────────────────────
    const handleUnsolve = useCallback(async (e: React.MouseEvent, problemId: number) => {
        e.preventDefault();
        e.stopPropagation();

        await unmarkSolved(problemId);
    }, [unmarkSolved]);

    // ── Render helpers ────────────────────────────────────────────────────
    if (isLoading) {
        return (
            <div className="flex justify-center items-center py-20">
                <div className="w-12 h-12 border-4 border-zinc-800 border-t-cyan-500 rounded-full animate-spin"></div>
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center text-red-400 py-10 clay-card p-8 max-w-lg mx-auto">
                {error}
            </div>
        );
    }

    return (
        <>
            {/* Topics list */}
            <div className="flex flex-col items-center gap-6 w-full max-w-3xl mx-auto">
                {topics.map(topic => {
                    // Count how many problems in this topic the user has solved
                    const totalProblems = topic.patterns.reduce((sum, p) => sum + (p.problems?.length ?? 0), 0);
                    const solvedCount = topic.patterns.reduce(
                        (sum, p) => sum + (p.problems?.filter(prob => solvedProblemIds.has(prob.id)).length ?? 0), 0
                    );
                    return (
                        <div
                            key={topic.id}
                            onClick={() => setSelectedTopic(topic)}
                            className="clay-card w-full p-6 md:p-8 cursor-pointer flex flex-col sm:flex-row justify-between items-start sm:items-center group gap-4"
                        >
                            <h3 className="text-xl md:text-2xl font-serif text-white group-hover:text-cyan-400 transition-colors text-left">
                                {topic.name}
                            </h3>
                            <div className="flex items-center gap-3 shrink-0">
                                {solvedCount > 0 && (
                                    <span className="text-xs font-semibold text-emerald-400 bg-emerald-500/10 border border-emerald-500/30 px-3 py-1 rounded-full">
                                        {solvedCount}/{totalProblems} solved
                                    </span>
                                )}
                                <div className="px-4 py-2 rounded-full bg-black/30 border border-white/5 text-sm text-zinc-400 group-hover:border-cyan-500/30 transition-colors">
                                    {topic.patterns?.length || 0} Patterns
                                </div>
                            </div>
                        </div>
                    );
                })}
            </div>

            {/* Overlay */}
            {selectedTopic && (
                <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-md">
                    <div className="clay-panel w-full max-w-3xl max-h-[90vh] rounded-3xl p-6 md:p-8 flex flex-col relative overflow-hidden">
                        {/* Close button */}
                        <button
                            onClick={() => { setSelectedTopic(null); setSelectedPattern(null); }}
                            className="absolute top-6 right-6 p-2 rounded-full hover:bg-white/10 text-zinc-400 hover:text-white transition-colors z-10"
                            aria-label="Close overlay"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                        </button>

                        {/* Breadcrumb & Header */}
                        <div className="mb-6 pr-12">
                            <div className="text-sm font-medium text-zinc-400 mb-3 flex flex-wrap gap-2 items-center">
                                <button
                                    onClick={() => setSelectedPattern(null)}
                                    className={`transition-colors ${selectedPattern ? 'hover:text-cyan-400 cursor-pointer text-zinc-300' : 'text-cyan-400 cursor-default'}`}
                                >
                                    {selectedTopic.name}
                                </button>
                                {selectedPattern && (
                                    <>
                                        <span className="text-zinc-600">&gt;</span>
                                        <span className="text-cyan-400 cursor-default">{selectedPattern.name}</span>
                                    </>
                                )}
                            </div>
                            <h2 className="text-2xl md:text-3xl font-serif text-white leading-tight">
                                {selectedPattern ? selectedPattern.name : selectedTopic.name}
                            </h2>
                        </div>

                        {/* Content Area */}
                        <div className="overflow-y-auto flex-1 pr-1">
                            {!selectedPattern ? (
                                /* Patterns list */
                                <div className="flex flex-col gap-4">
                                    {selectedTopic.patterns.map(pattern => {
                                        const patternSolved = (pattern.problems || []).filter(p => solvedProblemIds.has(p.id)).length;
                                        return (
                                            <div
                                                key={pattern.id}
                                                onClick={() => setSelectedPattern(pattern)}
                                                className="clay-card p-5 cursor-pointer flex flex-col sm:flex-row justify-between sm:items-center gap-4 group"
                                            >
                                                <span className="font-medium text-lg text-zinc-100 group-hover:text-cyan-400 transition-colors">
                                                    {pattern.name}
                                                </span>
                                                <div className="flex items-center gap-2 shrink-0 self-start sm:self-auto">
                                                    {patternSolved > 0 && (
                                                        <span className="text-xs text-emerald-400 bg-emerald-500/10 border border-emerald-500/30 px-2 py-1 rounded-full">
                                                            {patternSolved}/{pattern.problems.length}
                                                        </span>
                                                    )}
                                                    <span className="text-sm text-zinc-400 bg-black/20 px-3 py-1 rounded-full border border-white/5 group-hover:border-cyan-500/30 whitespace-nowrap">
                                                        {pattern.problems?.length || 0} Problems
                                                    </span>
                                                </div>
                                            </div>
                                        );
                                    })}
                                </div>
                            ) : (
                                /* Problems list */
                                <div className="flex flex-col gap-3">
                                    {selectedPattern.problems.map(problem => {
                                        const isSolved = solvedProblemIds.has(problem.id);
                                        const isPending = pendingIds.has(problem.id);
                                        return (
                                            <a
                                                key={problem.id}
                                                href={problem.leetcodeUrl}
                                                target="_blank"
                                                rel="noopener noreferrer"
                                                className={`clay-card p-4 block group transition-all ${isSolved ? 'border border-emerald-500/20' : ''}`}
                                            >
                                                <div className="flex flex-col sm:flex-row justify-between sm:items-center gap-3">
                                                    <div className="flex items-center gap-3 min-w-0">
                                                        {/* Solved checkmark */}
                                                        {isSolved && (
                                                            <svg className="text-emerald-400 shrink-0" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                                        )}
                                                        <span className={`font-medium text-base truncate transition-colors ${isSolved ? 'text-emerald-300 group-hover:text-emerald-200' : 'text-zinc-100 group-hover:text-emerald-400'}`}>
                                                            {problem.title}
                                                        </span>
                                                    </div>

                                                    <div className="flex items-center gap-2 shrink-0 self-start sm:self-auto">
                                                        {/* Difficulty badge */}
                                                        <span className={`text-xs font-bold px-3 py-1 rounded-full border whitespace-nowrap ${problem.difficulty === 'EASY' ? 'text-emerald-400 border-emerald-500/30 bg-emerald-500/10' :
                                                            problem.difficulty === 'MEDIUM' ? 'text-amber-400 border-amber-500/30 bg-amber-500/10' :
                                                                'text-rose-400 border-rose-500/30 bg-rose-500/10'
                                                            }`}>
                                                            {problem.difficulty}
                                                        </span>

                                                        {/* Solve / Unsolve button */}
                                                        {isSolved ? (
                                                            <button
                                                                onClick={(e) => handleUnsolve(e, problem.id)}
                                                                disabled={isPending}
                                                                className="text-xs font-semibold px-3 py-1 rounded-full border border-rose-500/30 bg-rose-500/10 text-rose-400 hover:bg-rose-500/20 transition-colors cursor-pointer disabled:opacity-50 whitespace-nowrap"
                                                            >
                                                                {isPending ? '...' : 'Unsolve'}
                                                            </button>
                                                        ) : (
                                                            <button
                                                                onClick={(e) => handleMarkSolved(e, problem.id)}
                                                                disabled={isPending}
                                                                className="text-xs font-semibold px-3 py-1 rounded-full border border-zinc-600 bg-zinc-800/50 text-zinc-300 hover:border-emerald-500/40 hover:text-emerald-400 hover:bg-emerald-500/10 transition-colors cursor-pointer disabled:opacity-50 whitespace-nowrap"
                                                            >
                                                                {isPending ? '...' : 'Mark Solved'}
                                                            </button>
                                                        )}
                                                    </div>
                                                </div>
                                            </a>
                                        );
                                    })}
                                    {selectedPattern.problems.length === 0 && (
                                        <div className="text-center text-zinc-500 py-10">
                                            No problems mapped to this pattern yet.
                                        </div>
                                    )}
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            )}
        </>
    );
}
