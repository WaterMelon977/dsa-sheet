package com.sumanth.sheet.security;

import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtService jwtService;

    public JwtAuthenticationFilter(JwtService jwtService) {
        this.jwtService = jwtService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {

        String token = extractTokenFromHeader(request);

        // We only use the Authorization header for JWT tokens in this application.

        if (token != null && jwtService.isTokenValid(token)) {
            Claims claims = jwtService.parseToken(token);
            String username = claims.getSubject();
            Long id = claims.get("id", Long.class);
            String provider = claims.get("provider", String.class);
            String avatar = claims.get("avatar", String.class);
            String email = claims.get("email", String.class);

            Map<String, Object> details = Map.of(
                    "id", id != null ? id : -1L,
                    "username", username != null ? username : "",
                    "provider", provider != null ? provider : "",
                    "avatar", avatar != null ? avatar : "",
                    "email", email != null ? email : "");

            UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(username, null,
                    Collections.emptyList());
            auth.setDetails(details);
            SecurityContextHolder.getContext().setAuthentication(auth);
        }

        filterChain.doFilter(request, response);
    }

    private String extractTokenFromHeader(HttpServletRequest request) {
        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            return header.substring(7);
        }
        return null;
    }

    // extractTokenFromCookie method removed as it is no longer used.
}
