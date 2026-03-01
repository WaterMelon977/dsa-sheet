package com.sumanth.sheet.controller;

import com.sumanth.sheet.service.ProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Set;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ProgressController {

    private final ProgressService progressService;

    // Returns all solved problem IDs for the logged-in user
    @GetMapping("/roadmap/progress")
    public Map<String, Set<Long>> getProgress(Authentication authentication) {
        Long userId = extractUserId(authentication);
        Set<Long> solved = progressService.getSolvedProblemIds(userId);
        return Map.of("solvedProblemIds", solved);
    }

    // Marks a problem as solved for the logged-in user
    @PostMapping("/problems/{problemId}/solve")
    public ResponseEntity<Void> markSolved(
            @PathVariable Long problemId,
            Authentication authentication) {
        Long userId = extractUserId(authentication);
        progressService.markSolved(userId, problemId);
        return ResponseEntity.ok().build();
    }

    // Removes a problem from the user's solved list
    @DeleteMapping("/problems/{problemId}/solve")
    public ResponseEntity<Void> unmarkSolved(
            @PathVariable Long problemId,
            Authentication authentication) {
        Long userId = extractUserId(authentication);
        progressService.unmarkSolved(userId, problemId);
        return ResponseEntity.noContent().build();
    }

    // Extract user ID from the JWT-populated Authentication details map
    private Long extractUserId(Authentication authentication) {
        @SuppressWarnings("unchecked")
        Map<String, Object> details = (Map<String, Object>) ((UsernamePasswordAuthenticationToken) authentication)
                .getDetails();
        return ((Number) details.get("id")).longValue();
    }
}
