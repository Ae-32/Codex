# Progress Tracker — Codex

## Unit Status Overview
- `[Done]` **Unit 00: Project Context Setup & Specs**
- `[Done]` **Unit 01: Flutter App Initialization & Clean Directory Setup**
- `[Done]` **Unit 02: Core Data Models & Asset Parsing Engine**
- `[Done]` **Unit 03: Language Selection Grid Screen**
- `[Done]` **Unit 04: Topic Hierarchy & Navigation View**
- `[Done]` **Unit 05: Cheat Sheet Markdown & Syntax Highlighter Reader**
- `[Done]` **Unit 06: Bundled Sample Content (Python, JavaScript, Rust, SQL, Dart)**
- `[Pending]` **Unit 07: Global Search & Filter Engine**
- `[Pending]` **Unit 08: Bookmarks & Saved Snippets Feature**
- `[Pending]` **Unit 09: Dark Theme Styling & UI Polish**
- `[Pending]` **Unit 10: App Build Verification & Launch Readiness**

---

## Detailed Unit Backlog

### Unit 00: Project Context Setup & Specs
- [x] Create 6 markdown context files in `/context`.
- [x] Define system invariants and data decoupling architecture.
- [x] Align with user on initial language set and content format.
- **Exit Criteria**: All 6 context files locked in and verified by Architect.

### Unit 01: Flutter App Initialization & Clean Directory Setup
- [x] Initialize clean Flutter project in root directory.
- [x] Configure `pubspec.yaml` with Riverpod, Markdown, Highlight, and SVG packages.
- [x] Set up feature-first folder structure in `lib/`.
- **Exit Criteria**: `flutter run` compiles cleanly with zero errors on mobile emulator.

### Unit 02: Core Data Models & Asset Parsing Engine
- [x] Create `Language`, `Topic`, and `CheatSheet` Dart data models.
- [x] Implement `ContentLoaderService` to parse asset `.md` files dynamically.
- [x] Write unit test verifying Markdown frontmatter parsing (`content_service_test.dart`).
- **Exit Criteria**: Mock asset file successfully parses into Dart data models. All 3 unit tests pass.

### Unit 03: Language Selection Grid Screen
- [x] Build `LanguageCardWidget` component with icon & sheet count badge.
- [x] Implement `LanguagesScreen` grid view with search filter and category badges.
- **Exit Criteria**: Users can view and filter available languages on screen.

### Unit 04: Topic Hierarchy & Navigation View
- [x] Build `TopicsScreen` displaying topic list and difficulty badges.
- [x] Integrate navigation between language grid and topic view.
- **Exit Criteria**: Users can tap a language card to browse its structured topic hierarchy.

### Unit 05: Cheat Sheet Markdown & Syntax Highlighter Reader
- [x] Build `CheatSheetDetailScreen` using `flutter_markdown`.
- [x] Integrate `CodeBlockWidget` with syntax highlighting and copy-to-clipboard functionality.
- **Exit Criteria**: Markdown cheat sheets render cleanly with dark theme code blocks.
