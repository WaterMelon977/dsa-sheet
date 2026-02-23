# 🚀 AlgoMap DSA Tracker — Backend

Production-style Spring Boot backend for an AlgoMap-style DSA practice tracker where users log in via OAuth and track solved problems with persistent progress.

This project focuses on **clean system design**, **event-driven authentication**, and **scalable backend architecture** rather than just CRUD functionality.

---

# 📌 Overview

AlgoMap DSA Tracker allows users to:

* Login using **Google or GitHub OAuth**
* View structured DSA roadmap topics and problems
* Mark LeetCode problems as completed
* Persist progress across sessions
* Experience fast, seamless login powered by **Redis Streams**

The backend is built as a **modular monolith** designed with microservice-ready boundaries.

---

# 🧱 Architecture

## High-Level Flow

```
User Login
   ↓
OAuth Provider (Google/GitHub)
   ↓
Spring Security OAuth2SuccessHandler
   ↓
JWT Generated (Stateless Auth)
   ↓
USER_LOGIN event → Redis Stream
   ↓
Async Consumer persists user to PostgreSQL
```

### Key Design Decisions

* Stateless JWT authentication
* Event-driven user persistence
* Redis Streams for async workflows
* Clean separation of Auth, Problem, and Progress modules

---

# ⚙️ Tech Stack

## Backend

* Java 17
* Spring Boot 3
* Spring Security
* OAuth2 Client
* JWT Authentication

## Data Layer

* PostgreSQL
* Spring Data JPA
* Redis (Streams + Cache)

## Infrastructure

* Docker (optional)
* Modular Monolith Architecture

---

# 🔐 Authentication Design

### Supported Providers

* Google OAuth
* GitHub OAuth

### Login Strategy

Instead of blocking login with a database call:

1. OAuth success generates JWT immediately.
2. A `USER_LOGIN` event is published to Redis Streams.
3. Background consumer persists or updates user data.

Benefits:

* Low login latency
* Scalable auth pipeline
* Microservice-ready event architecture

---

# 🗄️ Database Schema (Core Tables)

## Users

```
users
------
id (UUID)
email (UNIQUE)
name
provider
provider_id
created_at
last_login_at
```

## Topics

```
topics
------
id
title
order_index
```

## Problems

```
problems
--------
id
title
leetcode_slug
difficulty
topic_id
order_index
```

## User Progress

```
user_problem_progress
---------------------
user_id
problem_id
status
completed_at
```

Composite unique index:

```
(user_id, problem_id)
```

---

# ⚡ Event-Driven Login (Redis Streams)

## Stream

```
auth:user-events
```

## Event Example

```json
{
  "eventType": "USER_LOGIN",
  "email": "user@gmail.com",
  "name": "User",
  "provider": "google",
  "providerId": "123456"
}
```

## Consumer Responsibilities

* Read login events
* Insert or update user records
* Maintain idempotency using unique email constraint

---

# 📂 Project Structure

```
com.algomap
   ├── config
   ├── security
   ├── auth
   ├── user
   ├── problem
   ├── progress
   ├── events
   └── common
```

---

# 🔗 Core API Endpoints

## Authentication

```
GET /oauth2/authorization/google
GET /oauth2/authorization/github
```

Handled by Spring Security.

---

## Roadmap

```
GET /api/roadmap
```

Returns:

* Topics
* Problems
* User completion status

---

## Progress

```
POST /api/progress/{problemId}
GET  /api/me/progress
```

---

# 🚀 Running Locally

## 1️⃣ Clone

```
git clone <repo-url>
cd algomap-backend
```

---

## 2️⃣ Configure Environment

Create `application.yml`:

```
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/algomap
    username: postgres
    password: password

  data:
    redis:
      host: localhost
      port: 6379
```

Add OAuth credentials:

```
spring.security.oauth2.client.registration.google.client-id=
spring.security.oauth2.client.registration.google.client-secret=

spring.security.oauth2.client.registration.github.client-id=
spring.security.oauth2.client.registration.github.client-secret=
```

---

## 3️⃣ Run Services

Start PostgreSQL and Redis:

```
docker compose up -d
```

Run backend:

```
mvn spring-boot:run
```

---

# 📈 Performance & Scaling

* Redis caching for roadmap data
* Async DB writes via Streams
* Indexed relational schema
* Stateless authentication
* Modular service boundaries

Designed to scale to high read traffic with minimal latency.

---

# 🧩 Future Enhancements

* Streak tracking & analytics
* Public user profiles
* Notes per problem
* Admin roadmap editor
* Leaderboards

---

# 🧠 Design Goals

This project demonstrates:

* Real-world OAuth + JWT architecture
* Event-driven backend design
* Clean Spring Boot layering
* Interview-level system design practices

---

# 📜 License

MIT License
