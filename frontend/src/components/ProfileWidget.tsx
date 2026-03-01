'use client';

import React from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useProgress } from '@/context/ProgressContext';

export default function ProfileWidget() {
    const { user, isLoading, logout } = useProgress();

    if (isLoading) {
        return <div className="h-9 w-9 animate-pulse rounded-full" style={{ background: 'rgba(255,255,255,0.05)' }} />;
    }

    if (!user) {
        return (
            <Link
                href="/login"
                className="glass-btn px-5 py-2 text-sm font-medium text-white"
            >
                Login
            </Link>
        );
    }

    return (
        <div className="glass-widget flex items-center gap-3 p-1 pr-4">
            {/* Avatar */}
            <div className="relative h-8 w-8 overflow-hidden rounded-full border border-white/10 shrink-0">
                {user.avatar ? (
                    <Image src={user.avatar} alt={user.username} fill className="object-cover" />
                ) : (
                    <div className="flex h-full w-full items-center justify-center bg-zinc-900 text-xs font-bold text-zinc-400">
                        {user.username.charAt(0).toUpperCase()}
                    </div>
                )}
            </div>

            {/* Name */}
            <div className="flex flex-col leading-none">
                <span className="text-sm font-medium text-white/90">{user.username}</span>
                <span className="text-[11px] text-zinc-500 truncate max-w-[110px] mt-0.5">{user.email}</span>
            </div>

            {/* Logout */}
            <button
                onClick={logout}
                className="ml-1 p-1.5 rounded-full text-zinc-600 hover:text-zinc-300 hover:bg-white/8 transition-colors"
                title="Sign out"
            >
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                    <polyline points="16 17 21 12 16 7" />
                    <line x1="21" y1="12" x2="9" y2="12" />
                </svg>
            </button>
        </div>
    );
}
