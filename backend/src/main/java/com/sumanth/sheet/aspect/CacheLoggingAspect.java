package com.sumanth.sheet.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

@Aspect
@Component
@RequiredArgsConstructor
public class CacheLoggingAspect {

    private final CacheManager cacheManager;

    @Around("@annotation(cacheable)")
    public Object logCacheHitMiss(ProceedingJoinPoint joinPoint, Cacheable cacheable) throws Throwable {
        String cacheName = cacheable.value().length > 0 ? cacheable.value()[0] : cacheable.cacheNames()[0];
        Object key = resolveKey(cacheable.key(), joinPoint.getArgs());

        Cache cache = cacheManager.getCache(cacheName);
        if (cache != null) {
            Cache.ValueWrapper valueWrapper = cache.get(key);
            if (valueWrapper != null) {
                System.out.println("CACHE :HIT");
                return valueWrapper.get();
            }
        }

        System.out.println("CACHE: MISS");
        return joinPoint.proceed();
    }

    private Object resolveKey(String keyExpr, Object[] args) {
        if (keyExpr != null && !keyExpr.isEmpty()) {
            // Handle simple literal keys like "'all'"
            if (keyExpr.startsWith("'") && keyExpr.endsWith("'")) {
                return keyExpr.substring(1, keyExpr.length() - 1);
            }
        }
        return generateKey(args);
    }

    private Object generateKey(Object[] args) {
        if (args.length == 0) {
            return org.springframework.cache.interceptor.SimpleKey.EMPTY;
        }
        if (args.length == 1) {
            return args[0];
        }
        return new org.springframework.cache.interceptor.SimpleKey(args);
    }
}
