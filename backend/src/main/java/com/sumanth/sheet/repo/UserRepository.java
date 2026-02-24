package com.sumanth.sheet.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sumanth.sheet.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    Optional<User> findByProviderAndProviderId(String provider, String providerId);
}
