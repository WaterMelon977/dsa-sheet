package com.sumanth.sheet.security;

import com.sumanth.sheet.model.OAuthUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final JwtService jwtService;
    private final String frontendUrl;
    private final OAuth2UserProcessor oauth2UserProcessor;

    public OAuth2LoginSuccessHandler(
            JwtService jwtService,
            @Value("${FRONTEND_URL:http://localhost:3000}") String frontendUrl,
            OAuth2UserProcessor oauth2UserProcessor) {
        this.jwtService = jwtService;
        this.frontendUrl = frontendUrl;
        this.oauth2UserProcessor = oauth2UserProcessor;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
        String provider = oauthToken.getAuthorizedClientRegistrationId();
        OAuth2User oAuth2User = oauthToken.getPrincipal();

        // Try to get processed user from attributes (set by CustomUserService)
        OAuthUser oAuthUser = (OAuthUser) oAuth2User.getAttributes().get("oAuthUser");

        // Fallback: process user now if missing (e.g. from OIDC which doesn't allow
        // easy attribute injection)
        if (oAuthUser == null) {
            oAuthUser = oauth2UserProcessor.processUser(provider, oAuth2User.getAttributes());
        }

        String token = jwtService.generateToken(
                oAuthUser.getId(),
                oAuthUser.getUsername(),
                oAuthUser.getProvider(),
                oAuthUser.getAvatar(),
                oAuthUser.getEmail());

        // Redirect to frontend with token as a query parameter.
        String redirectUrl = frontendUrl + "/auth/callback?token="
                + URLEncoder.encode(token, StandardCharsets.UTF_8);

        response.sendRedirect(redirectUrl);
    }
}
