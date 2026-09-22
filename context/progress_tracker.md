# Progress Tracker — Codex

## Unit Status Overview
- `[Done]` **Unit 00: Project Context Setup & Specs**
- `[Done]` **Unit 01: Flutter App Initialization & Clean Directory Setup**
- `[In Progress]` **Unit 02: Core Data Models & Asset Parsing Engine**
- `[Pending]` **Unit 03: Language Selection Grid Screen**
- `[Pending]` **Unit 04: Topic Hierarchy & Navigation View**
- `[Pending]` **Unit 05: Cheat Sheet Markdown & Syntax Highlighter Reader**
- `[Pending]` **Unit 06: Bundled Sample Content (Python, JavaScript, Rust, SQL)**
- `[Pending]` **Unit 07: Global Search & Filter Engine**
- `[Pending]` **Unit 08: Bookmarks & Saved Snippets Feature**
- `[Pending]` **Unit 09: Dark Theme Styling & UI Polish**
- `[Pending]` **Unit 10: App Build Verification & Launch Readiness**

---

## Detailed Unit Backlog

### Unit 00: Project Context Setup & Specs
- [x] Create 6 markdown context files in `/context`.
- [x] Define system invariants and data decoupling architecture.
- [ ] Align with user on initial language set and content format.
- **Exit Criteria**: All 6 context files locked in and verified by Architect.

### Unit 01: Flutter App Initialization & Clean Directory Setup
- [ ] Initialize clean Flutter project in root directory.
- [ ] Configure `pubspec.yaml` with Riverpod, Markdown, Highlight, and SVG packages.
- [ ] Set up feature-first folder structure in `lib/`.
- **Exit Criteria**: `flutter run` compiles cleanly with zero errors on mobile emulator.

### Unit 02: Core Data Models & Asset Parsing Engine
- [ ] Create `Language`, `Topic`, and `CheatSheet` Dart data models.
- [ ] Implement `ContentLoaderService` to parse asset `.md` files dynamically.
- [ ] Write unit test verifying Markdown frontmatter parsing.
- **Exit Criteria**: Mock asset file successfully parses into Dart data models.

### Unit 03: Language Selection Grid Screen
- [ ] Build `LanguageCard` component with SVG logo & sheet count badge.
- [ ] Implement Language Grid view with search filter.
- **Exit Criteria**: Users can view and filter available languages on screen.
