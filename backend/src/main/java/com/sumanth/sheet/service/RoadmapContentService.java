package com.sumanth.sheet.service;

import com.sumanth.sheet.dto.PatternDTO;
import com.sumanth.sheet.dto.ProblemDTO;
import com.sumanth.sheet.dto.TopicDTO;
import com.sumanth.sheet.model.Pattern;
import com.sumanth.sheet.model.Topic;
import com.sumanth.sheet.repository.TopicRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RoadmapContentService {

        private final TopicRepository topicRepository;

        @Cacheable(value = "roadmapContent", key = "'all'")
        public List<TopicDTO> getRoadmapContent() {
                // Fetch topics with patterns and problems in a single query
                List<Topic> topics = topicRepository.fetchFullRoadmap();

                // Convert Entities to DTO tree
                return topics.stream()
                                .map(this::mapToTopicDTO)
                                .collect(Collectors.toList());
        }

        private TopicDTO mapToTopicDTO(Topic topic) {
                return TopicDTO.builder()
                                .id(topic.getId())
                                .name(topic.getName())
                                .orderIndex(topic.getOrderIndex())
                                .patterns(topic.getPatterns() != null
                                                ? topic.getPatterns().stream().map(this::mapToPatternDTO)
                                                                .collect(Collectors.toList())
                                                : List.of())
                                .build();
        }

        private PatternDTO mapToPatternDTO(Pattern pattern) {
                return PatternDTO.builder()
                                .id(pattern.getId())
                                .name(pattern.getName())
                                .orderIndex(pattern.getOrderIndex())
                                .problems(pattern.getProblems() != null
                                                ? pattern.getProblems().stream().map(this::mapToProblemDTO)
                                                                .collect(Collectors.toList())
                                                : List.of())
                                .build();
        }

        private ProblemDTO mapToProblemDTO(com.sumanth.sheet.model.Problem problem) {
                return ProblemDTO.builder()
                                .id(problem.getId())
                                .title(problem.getTitle())
                                .difficulty(problem.getDifficulty())
                                .difficultyScore(problem.getDifficultyScore())
                                .leetcodeUrl(problem.getLeetcodeUrl())
                                .build();
        }
}
