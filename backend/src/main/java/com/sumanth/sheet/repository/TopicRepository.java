package com.sumanth.sheet.repository;

import com.sumanth.sheet.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopicRepository extends JpaRepository<Topic, Long> {

    @Query("""
            SELECT DISTINCT t
            FROM Topic t
            LEFT JOIN FETCH t.patterns p
            LEFT JOIN FETCH p.problems pr
            ORDER BY t.orderIndex, p.orderIndex, pr.orderIndex
            """)
    List<Topic> fetchFullRoadmap();

}
