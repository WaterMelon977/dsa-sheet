'use client';

import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';

interface UserProfile {
    username: string;
    email: string;
    avatar: string;
    provider: string;
}

export default function ProfileWidget() {
    const [profile, setProfile] = useState<UserProfile | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchProfile = async () => {
            const token = localStorage.getItem('token');

            if (!token) {
                setLoading(false);
                return;
            }

            try {
                const response = await fetch(`${process.env.NEXT_PUBLIC_API_BASE}/api/me`, {
                    method: 'GET',
                    headers: {
                        'Authorization': `Bearer ${token}`
                    }
                });

                if (response.ok) {
                    const data = await response.json();
                    setProfile(data);
                } else if (response.status === 401) {
                    // Token is invalid/expired or unauthorized error returned from backend
                    const errorData = await response.json().catch(() => ({}));
                    console.warn("Unauthorized API access:", errorData);
                    localStorage.removeItem('token');
                    setProfile(null);
                }
            } catch (error) {
                console.error("Error fetching profile:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchProfile();
    }, []);

    const handleLogout = () => {
        localStorage.removeItem('token');
        setProfile(null);
    };

    if (loading) {
        return (
            <div className="h-10 w-10 animate-pulse rounded-full bg-zinc-200 dark:bg-zinc-800"></div>
        );
    }

    if (!profile) {
        return (
            <Link
                href="/login"
                className="rounded-full bg-black px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-zinc-800 dark:bg-white dark:text-black dark:hover:bg-zinc-200"
            >
                Login
            </Link>
        );
    }

    return (
        <div className="flex items-center gap-3 rounded-full border border-zinc-200 bg-white p-1 pr-4 shadow-sm dark:border-zinc-800 dark:bg-zinc-900">
            <div className="relative h-9 w-9 overflow-hidden rounded-full">
                {profile.avatar ? (
                    <Image
                        src={profile.avatar}
                        alt={profile.username}
                        fill
                        className="object-cover"
                    />
                ) : (
                    <div className="flex h-full w-full items-center justify-center bg-zinc-200 text-sm font-bold text-zinc-600 dark:bg-zinc-800 dark:text-zinc-400">
                        {profile.username.charAt(0).toUpperCase()}
                    </div>
                )}
            </div>
            <div className="flex flex-col">
                <span className="text-sm font-bold leading-tight text-zinc-900 dark:text-zinc-100">
                    {profile.username}
                </span>
                <span className="text-xs leading-tight text-zinc-500 dark:text-zinc-400 truncate max-w-[120px]">
                    {profile.email}
                </span>
            </div>
            <button
                onClick={handleLogout}
                className="ml-2 rounded-full p-1.5 text-zinc-400 hover:bg-zinc-100 hover:text-zinc-700 dark:hover:bg-zinc-800 dark:hover:text-zinc-300 transition-colors"
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
