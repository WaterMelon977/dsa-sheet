package com.sumanth.sheet.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@ToString(exclude = "pattern")
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "problems")
public class Problem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    private String title;

    private String difficulty;

    private Integer difficultyScore;

    private String leetcodeUrl;

    private Integer orderIndex;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pattern_id")
    private Pattern pattern;
}
