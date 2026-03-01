'use client';

import React, { useEffect, useState } from 'react';

export default function WaveBackground() {
    const [mounted, setMounted] = useState(false);

    useEffect(() => {
        setMounted(true);
    }, []);

    if (!mounted) return null;

    return (
        <div className="pointer-events-none fixed inset-0 overflow-hidden" aria-hidden="true" style={{ zIndex: 0 }}>
            {/* Deep space ambient glow orbs */}
            <div
                className="absolute rounded-full"
                style={{
                    width: '600px',
                    height: '600px',
                    top: '-100px',
                    left: '-150px',
                    background: 'radial-gradient(circle, rgba(99,102,241,0.12) 0%, transparent 70%)',
                    animation: 'float-orb 14s ease-in-out infinite',
                    filter: 'blur(40px)',
                }}
            />
            <div
                className="absolute rounded-full"
                style={{
                    width: '500px',
                    height: '500px',
                    top: '30%',
                    right: '-100px',
                    background: 'radial-gradient(circle, rgba(34,211,238,0.09) 0%, transparent 70%)',
                    animation: 'float-orb 18s ease-in-out infinite reverse',
                    filter: 'blur(50px)',
                    animationDelay: '-6s',
                }}
            />
            <div
                className="absolute rounded-full"
                style={{
                    width: '400px',
                    height: '400px',
                    bottom: '10%',
                    left: '20%',
                    background: 'radial-gradient(circle, rgba(52,211,153,0.07) 0%, transparent 70%)',
                    animation: 'float-orb 22s ease-in-out infinite',
                    filter: 'blur(60px)',
                    animationDelay: '-10s',
                }}
            />

            {/* Animated SVG wave lines — inspired by the provided plasma wave image */}
            <svg
                viewBox="0 0 1920 300"
                preserveAspectRatio="none"
                xmlns="http://www.w3.org/2000/svg"
                style={{
                    position: 'absolute',
                    bottom: '5%',
                    left: 0,
                    width: '100%',
                    height: '300px',
                    opacity: 0.1,
                    animation: 'glow-pulse 8s ease-in-out infinite',
                }}
            >
                <defs>
                    <linearGradient id="waveGrad1" x1="0%" y1="0%" x2="100%" y2="0%">
                        <stop offset="0%" stopColor="#4f46e5" stopOpacity="0" />
                        <stop offset="20%" stopColor="#4f46e5" stopOpacity="0.9" />
                        <stop offset="55%" stopColor="#06b6d4" stopOpacity="0.9" />
                        <stop offset="80%" stopColor="#a855f7" stopOpacity="0.7" />
                        <stop offset="100%" stopColor="#a855f7" stopOpacity="0" />
                    </linearGradient>
                    <linearGradient id="waveGrad2" x1="0%" y1="0%" x2="100%" y2="0%">
                        <stop offset="0%" stopColor="#06b6d4" stopOpacity="0" />
                        <stop offset="25%" stopColor="#06b6d4" stopOpacity="0.5" />
                        <stop offset="60%" stopColor="#8b5cf6" stopOpacity="0.5" />
                        <stop offset="100%" stopColor="#8b5cf6" stopOpacity="0" />
                    </linearGradient>
                    <linearGradient id="waveGrad3" x1="0%" y1="0%" x2="100%" y2="0%">
                        <stop offset="0%" stopColor="#818cf8" stopOpacity="0" />
                        <stop offset="30%" stopColor="#818cf8" stopOpacity="0.3" />
                        <stop offset="70%" stopColor="#34d399" stopOpacity="0.3" />
                        <stop offset="100%" stopColor="#34d399" stopOpacity="0" />
                    </linearGradient>
                    <filter id="waveGlow">
                        <feGaussianBlur stdDeviation="4" result="blur" />
                        <feMerge>
                            <feMergeNode in="blur" />
                            <feMergeNode in="SourceGraphic" />
                        </feMerge>
                    </filter>
                </defs>

                {/* Wave line 1 — primary plasma ribbon */}
                <path
                    fill="none"
                    stroke="url(#waveGrad1)"
                    strokeWidth="2.5"
                    filter="url(#waveGlow)"
                    style={{ animation: 'none' }}
                >
                    <animate
                        attributeName="d"
                        dur="12s"
                        repeatCount="indefinite"
                        values="M-100,150 C200,60 400,240 700,120 C1000,0 1200,180 1500,90 C1800,0 1950,130 2020,100;M-100,100 C200,200 400,40 700,180 C1000,300 1200,60 1500,200 C1800,100 1950,60 2020,150;M-100,170 C200,90 400,160 700,60 C1000,120 1200,200 1500,60 C1800,160 1950,180 2020,80;M-100,150 C200,60 400,240 700,120 C1000,0 1200,180 1500,90 C1800,0 1950,130 2020,100"
                        calcMode="spline"
                        keySplines="0.45 0 0.55 1; 0.45 0 0.55 1; 0.45 0 0.55 1"
                    />
                </path>

                {/* Wave line 2 — secondary ripple */}
                <path
                    fill="none"
                    stroke="url(#waveGrad2)"
                    strokeWidth="1.5"
                    filter="url(#waveGlow)"
                >
                    <animate
                        attributeName="d"
                        dur="16s"
                        repeatCount="indefinite"
                        values="M-100,130 C250,220 450,30 750,160 C1050,280 1250,80 1550,180 C1850,80 1950,200 2020,130;M-100,180 C250,80 450,200 750,60 C1050,160 1250,240 1550,80 C1850,200 1950,40 2020,180;M-100,80 C250,160 450,80 750,220 C1050,80 1250,140 1550,260 C1850,100 1950,120 2020,60;M-100,130 C250,220 450,30 750,160 C1050,280 1250,80 1550,180 C1850,80 1950,200 2020,130"
                        calcMode="spline"
                        keySplines="0.45 0 0.55 1; 0.45 0 0.55 1; 0.45 0 0.55 1"
                    />
                </path>

                {/* Wave line 3 — faint accent */}
                <path
                    fill="none"
                    stroke="url(#waveGrad3)"
                    strokeWidth="1"
                    opacity="0.6"
                >
                    <animate
                        attributeName="d"
                        dur="20s"
                        repeatCount="indefinite"
                        values="M-100,110 C300,30 500,200 800,90 C1100,0 1300,170 1600,70 C1900,0 1950,110 2020,80;M-100,60 C300,160 500,60 800,200 C1100,120 1300,60 1600,200 C1900,120 1950,60 2020,160;M-100,160 C300,80 500,180 800,40 C1100,160 1300,260 1600,80 C1900,200 1950,160 2020,100;M-100,110 C300,30 500,200 800,90 C1100,0 1300,170 1600,70 C1900,0 1950,110 2020,80"
                        calcMode="spline"
                        keySplines="0.45 0 0.55 1; 0.45 0 0.55 1; 0.45 0 0.55 1"
                    />
                </path>
            </svg>
        </div>
    );
}
