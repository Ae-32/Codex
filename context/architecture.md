# Architecture Blueprint — Codex

## 1. Technology Stack
- **Framework**: Flutter (v3.19+ / Stable)
- **Language**: Dart
- **State Management**: Riverpod (`flutter_riverpod`)
- **Content Rendering**: `flutter_markdown` (Markdown display) & `flutter_highlight` (Syntax highlighting)
- **Asset / Vector Rendering**: `flutter_svg` (Language logos)
- **Local Storage**: `shared_preferences` (Saved bookmarks & app settings)

## 2. Directory Structure (Feature-First Architecture)
```
lib/
├── main.dart
├── app/
│   ├── app.dart                   # Root MaterialApp configuration
│   ├── router.dart                # App navigation / routing
│   └── theme.dart                 # App theme tokens & styles
├── core/
│   ├── constants/                 # App constants & keys
│   ├── models/                    # Shared data models (Language, Topic, CheatSheet)
│   ├── services/                  # Content loader, Asset service, Storage service
│   ├── theme/                     # Dark mode color tokens & code syntax themes
│   └── widgets/                   # Reusable components (CodeBlock, SearchBar, LanguageBadge)
└── features/
    ├── languages/                 # Language selection grid & state
    ├── topics/                    # Topic listing & taxonomy management
    ├── cheat_sheets/              # Cheat sheet display & markdown reader
    ├── search/                    # Global search engine & UI
    └── bookmarks/                 # Saved cheat sheets management
assets/
└── cheat_sheets/                  # Structured content files
    ├── python/
    ├── javascript/
    ├── rust/
    └── sql/
```

## 3. Data Decoupling Architecture
```
+------------------------------------------------------------------+
|                       FLUTTER APP ENGINE                         |
|  (Renders UI, handles navigation, manages search & bookmarks)    |
+------------------------------------------------------------------+
                                 ^
                                 | Dynamic loading via Content Engine
                                 v
+------------------------------------------------------------------+
|                    CONTENT DATA FILES (ASSETS)                   |
|  - Language metadata (JSON/YAML)                                 |
|  - Topic taxonomy (JSON/YAML)                                    |
|  - Cheat sheets (.md files with Frontmatter metadata)            |
+------------------------------------------------------------------+
```

## 4. System Invariants (Unbreakable Rules)
1. **Zero Hardcoded Cheat Sheet Data in Dart**: All language information and cheat sheet code MUST be parsed dynamically from `.md` or `.json` asset files. Adding a new language must NEVER require changing widget code.
2. **Offline-First Guarantee**: Every core cheat sheet must be bundled within app assets and render without requiring an active network connection.
3. **Strict Content Schema Validation**: If a cheat sheet asset file contains malformed Markdown or unknown language tags, the app must gracefully render fallback plain text without crashing.
4. **Clean UI Layer**: UI widgets must only read state from Riverpod providers and must not perform direct disk/file reads inside `build()` methods.
