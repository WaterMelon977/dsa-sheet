'use client';

import React from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useProgress } from '@/context/ProgressContext';

export default function ProfileWidget() {
    const { user, isLoading, logout } = useProgress();

    if (isLoading) {
        return (
            <div className="h-10 w-10 animate-pulse rounded-full bg-zinc-200 dark:bg-zinc-800"></div>
        );
    }

    if (!user) {
        return (
            <Link
                href="/login"
                className="clay-btn px-6 py-2 text-sm font-medium text-white transition-all"
            >
                Login
            </Link>
        );
    }

    return (
        <div className="flex items-center gap-3 rounded-full border border-white/5 bg-black/40 p-1 pr-4 shadow-sm backdrop-blur-sm">
            <div className="relative h-9 w-9 overflow-hidden rounded-full border border-white/10">
                {user.avatar ? (
                    <Image
                        src={user.avatar}
                        alt={user.username}
                        fill
                        className="object-cover"
                    />
                ) : (
                    <div className="flex h-full w-full items-center justify-center bg-zinc-800 text-sm font-bold text-zinc-400">
                        {user.username.charAt(0).toUpperCase()}
                    </div>
                )}
            </div>
            <div className="flex flex-col">
                <span className="text-sm font-bold leading-tight text-white">
                    {user.username}
                </span>
                <span className="text-xs leading-tight text-zinc-500 truncate max-w-[120px]">
                    {user.email}
                </span>
            </div>
            <button
                onClick={logout}
                className="ml-2 rounded-full p-1.5 text-zinc-500 hover:bg-white/10 hover:text-white transition-colors"
                title="Logout"
            >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                    <polyline points="16 17 21 12 16 7" />
                    <line x1="21" y1="12" x2="9" y2="12" />
                </svg>
            </button>
        </div>
    );
}
