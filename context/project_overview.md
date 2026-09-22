# Project Overview — Codex

## 1. Product Vision
**Codex** is a modern, developer-centric mobile application built with Flutter that provides fast, offline-first programming language cheat sheets. Users navigate cheat sheets through a clean hierarchy: **Language → Topic → Cheat Sheet**, or search instantly across all languages.

## 2. Target Audience
- **Software Engineers & Developers**: Quick syntax lookup during pair programming or code reviews.
- **Computer Science Students**: Learning new programming languages or studying for exams.
- **DevOps & System Administrators**: Rapid reference for scripting languages, SQL queries, and shell commands.

## 3. Core User Journeys
1. **Browse by Hierarchy**: Select a language (e.g., Python, Rust, SQL) -> Select a topic (e.g., Syntax, Functions, Memory Management) -> Read syntax-highlighted cheat sheet.
2. **Global Search**: Search for concepts like "String formatting" or "Array map" across all installed languages simultaneously.
3. **Favorites & Offline Access**: Bookmark frequently accessed cheat sheets for one-tap access without an internet connection.

## 4. Explicit Out of Scope (v1 Non-Goals)
- **NO Interactive Code Compiler/Runner**: v1 is strictly for reading, searching, and copying cheat sheet code snippets.
- **NO User Accounts or Cloud Backend**: v1 is 100% client-side with local storage for bookmarks.
- **NO Paid Paywalls or Subscriptions**: Core initial language set is fully accessible.
- **NO Community Uploads / User Posts**: Content is managed via structured Markdown/JSON data files.
