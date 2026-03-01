package com.sumanth.sheet.repository;

import com.sumanth.sheet.model.UserProblemProgress;
import com.sumanth.sheet.model.UserProblemProgressId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserProgressRepository extends JpaRepository<UserProblemProgress, UserProblemProgressId> {

    // Returns only the problem IDs for a given user - avoids loading full entities
    @Query("SELECT upp.problem.id FROM UserProblemProgress upp WHERE upp.user.id = :userId")
    List<Long> findSolvedProblemIdsByUserId(Long userId);

    // Delete the specific progress record by user and problem IDs
    @Modifying
    @Query("DELETE FROM UserProblemProgress upp WHERE upp.user.id = :userId AND upp.problem.id = :problemId")
    void deleteByUserIdAndProblemId(Long userId, Long problemId);
}
