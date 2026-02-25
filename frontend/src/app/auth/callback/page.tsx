'use client';

import { useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { Suspense } from 'react';

function CallbackHandler() {
    const router = useRouter();
    const searchParams = useSearchParams();

    useEffect(() => {
        const token = searchParams.get('token');

        if (token) {
            // Save token to localStorage
            localStorage.setItem('token', token);

            // Clean up the URL and redirect to home
            router.replace('/');
        } else {
            // If no token is found, redirect to login
            router.replace('/login');
        }
    }, [router, searchParams]);

    return (
        <div className="flex min-h-screen items-center justify-center bg-white dark:bg-black">
            <div className="flex flex-col items-center gap-4">
                <div className="h-8 w-8 animate-spin rounded-full border-4 border-zinc-200 border-t-black dark:border-zinc-800 dark:border-t-white"></div>
                <p className="text-sm font-medium text-zinc-600 dark:text-zinc-400">Authenticating...</p>
            </div>
        </div>
    );
}

export default function AuthCallbackPage() {
    return (
        <Suspense fallback={
            <div className="flex min-h-screen items-center justify-center bg-white dark:bg-black">
                <div className="h-8 w-8 animate-spin rounded-full border-4 border-zinc-200 border-t-black dark:border-zinc-800 dark:border-t-white"></div>
            </div>
        }>
            <CallbackHandler />
        </Suspense>
    );
}
