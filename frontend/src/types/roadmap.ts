export type Problem = {
    id: number;
    title: string;
    difficulty: "EASY" | "MEDIUM" | "HARD";
    difficultyScore: number;
    leetcodeUrl: string;
};

export type Pattern = {
    id: number;
    name: string;
    orderIndex: number;
    problems: Problem[];
};

export type Topic = {
    id: number;
    name: string;
    orderIndex: number;
    patterns: Pattern[];
};

export interface UserProfile {
    username: string;
    email: string;
    avatar: string;
    provider: string;
}
