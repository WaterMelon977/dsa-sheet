package com.sumanth.sheet.controller;

import com.sumanth.sheet.dto.TopicDTO;
import com.sumanth.sheet.service.RoadmapContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ContentController {

    private final RoadmapContentService roadmapContentService;

    @GetMapping("/content")
    public List<TopicDTO> getContent() {
        return roadmapContentService.getRoadmapContent();
    }
}
