import ProfileWidget from "@/components/ProfileWidget";
import RoadmapViewer from "@/components/RoadmapViewer";
import UserProgressBanner from "@/components/UserProgressBanner";
import { ProgressProvider } from "@/context/ProgressContext";

export default function Home() {
  return (
    <ProgressProvider>
      <div className="flex min-h-screen flex-col bg-[#0a0a0a] font-sans selection:bg-cyan-500/30">
        <header className="flex w-full items-center justify-end p-6">
          <ProfileWidget />
        </header>
        <main className="flex flex-col flex-1 w-full max-w-6xl mx-auto px-6 py-12 md:py-20">
          <div className="flex flex-col items-center text-center gap-6 mb-16 md:mb-24">
            <div className="inline-flex items-center justify-center p-3 rounded-full bg-cyan-500/10 border border-cyan-500/20 mb-2">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-cyan-400"><path d="m18 16 4-4-4-4" /><path d="m6 8-4 4 4 4" /><path d="m14.5 4-5 16" /></svg>
            </div>
            <h1 className="max-w-3xl text-4xl md:text-5xl lg:text-6xl font-serif font-semibold leading-tight tracking-tight text-white mb-2">
              Master Data Structures & <br className="hidden md:block" />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-emerald-400">Algorithms</span> logically.
            </h1>
            <p className="max-w-2xl text-lg md:text-xl text-zinc-400 leading-relaxed font-sans font-medium">
              A comprehensive, elegantly structured path to dominating technical interviews using highly curated coding patterns.
            </p>
          </div>

          <UserProgressBanner />
          <RoadmapViewer />
        </main>

        <footer className="w-full border-t border-white/5 py-8 mt-20 text-center text-zinc-500 text-sm">
          <p>Built with Next.js & Spring Boot</p>
        </footer>
      </div>
    </ProgressProvider>
  );
}
