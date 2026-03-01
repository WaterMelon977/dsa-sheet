import ProfileWidget from "@/components/ProfileWidget";
import RoadmapViewer from "@/components/RoadmapViewer";
import UserProgressBanner from "@/components/UserProgressBanner";
import WaveBackground from "@/components/WaveBackground";
import { ProgressProvider } from "@/context/ProgressContext";

export default function Home() {
  return (
    <ProgressProvider>
      <div className="relative flex min-h-screen flex-col font-sans selection:bg-cyan-500/30 glass-mesh overflow-x-hidden"
        style={{ background: '#050508' }}>

        {/* ── Animated Background ── */}
        <WaveBackground />

        {/* ── Header ── */}
        <header className="relative z-10 flex w-full items-center justify-end p-6">
          <ProfileWidget />
        </header>

        {/* ── Main ── */}
        <main className="relative z-10 flex flex-col flex-1 w-full max-w-5xl mx-auto px-6 py-10 md:py-16">

          {/* Hero */}
          <div className="flex flex-col items-center text-center gap-5 mb-14 md:mb-20">
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-pill text-xs font-semibold tracking-widest uppercase text-cyan-400 mb-2">
              <span className="w-1.5 h-1.5 rounded-full bg-cyan-400 inline-block animate-pulse" />
              DSA Roadmap
            </div>
            <h1 className="max-w-3xl text-4xl md:text-5xl lg:text-[3.75rem] font-serif font-semibold leading-tight tracking-tight text-white">
              Data structures &amp; <br className="hidden md:block" />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-violet-400 to-emerald-400">
                algorithms
              </span>{" "}
              done right.
            </h1>
            <p className="max-w-2xl text-base md:text-lg text-zinc-400 leading-relaxed font-light">
              No fluff. Just the patterns and topics that actually matter.
            </p>
          </div>

          {/* Progress Banner */}
          <UserProgressBanner />

          {/* Roadmap */}
          <RoadmapViewer />

        </main>

        {/* ── Footer ── */}
        <footer className="relative z-10 w-full border-t border-white/5 py-8 mt-16 text-center text-zinc-600 text-sm">
          <p>Built with Next.js &amp; Spring Boot</p>
        </footer>
      </div>
    </ProgressProvider>
  );
}
