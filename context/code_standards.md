# Code Standards — Codex

## 1. Naming Conventions
- **Files & Directories**: `snake_case` (e.g., `language_card_widget.dart`, `python_basics.md`).
- **Classes & Enums**: `PascalCase` (e.g., `LanguageModel`, `CheatSheetView`).
- **Variables, Functions & Parameters**: `camelCase` (e.g., `selectedLanguage`, `loadCheatSheet()`).
- **Constants**: `lowerCamelCase` or `UPPER_SNAKE_CASE` for global constant values.

## 2. Flutter & Dart Best Practices
- **Use `const` Constructors**: Mark every widget constructor `const` whenever possible to optimize Flutter rebuild performance.
- **Widget Modularization**: Keep widget `build()` methods concise (< 150 lines). Extract complex UI sections into separate private or public StatelessWidgets.
- **Null Safety**: Strict adherence to Dart null safety. Avoid using the non-null assertion operator (`!`) unless guaranteed by design. Use defensive fallbacks (`??`).
- **Immutability**: Data models must be immutable. Use `@immutable` or `freezed`/`equatable` for value equality.

## 3. State Management Rules (Riverpod)
- Keep UI widgets purely presentational. Move all state mutations and business logic into Riverpod Providers / Notifiers.
- Do NOT call `setState()` for global app data or network state. Reserve `setState()` exclusively for transient local UI state (e.g., controlling a local animation controller or textField controller).

## 4. Error Handling & Defensive Coding
- Wrap all asset file parsing operations in try-catch blocks with descriptive logger output.
- Always provide user-friendly fallback widgets when loading content (e.g., `CheatSheetErrorWidget` instead of red screen of death).
