package com.sumanth.sheet.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OAuthUser {
    private Long id;
    private String username;
    private String email;
    private String avatar;
    private String provider;
}
