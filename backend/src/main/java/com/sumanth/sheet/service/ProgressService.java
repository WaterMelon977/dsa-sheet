package com.sumanth.sheet.service;

import com.sumanth.sheet.model.UserProblemProgress;
import com.sumanth.sheet.repo.UserRepository;
import com.sumanth.sheet.repository.UserProgressRepository;
import com.sumanth.sheet.repository.ProblemRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class ProgressService {

    private final UserProgressRepository userProgressRepository;
    private final UserRepository userRepository;
    private final ProblemRepository problemRepository;

    // Returns IDs of all problems solved by the given user
    public Set<Long> getSolvedProblemIds(Long userId) {
        return new HashSet<>(
                userProgressRepository.findSolvedProblemIdsByUserId(userId));
    }

    // Marks a problem as solved; silently ignores duplicates via DB constraint
    // catch
    public void markSolved(Long userId, Long problemId) {
        try {
            // getReferenceById creates a proxy without hitting the DB — safe for FK inserts
            UserProblemProgress progress = new UserProblemProgress(
                    userRepository.getReferenceById(userId),
                    problemRepository.getReferenceById(problemId));
            userProgressRepository.save(progress);
        } catch (DataIntegrityViolationException ignored) {
            // Already solved — do nothing
        }
    }

    // Removes a problem from the user's solved list
    @Transactional
    public void unmarkSolved(Long userId, Long problemId) {
        userProgressRepository.deleteByUserIdAndProblemId(userId, problemId);
    }
}
