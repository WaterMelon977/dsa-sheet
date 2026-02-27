package com.sumanth.sheet.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserProblemProgressId implements Serializable {
    private Long user;
    private Long problem;
}
