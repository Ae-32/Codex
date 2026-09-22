# UI Context & Design Tokens — Codex

## 1. Aesthetic Direction
- **Style**: Modern, sleek Dark-First developer aesthetic with glassmorphism touches and clean typography.
- **Vibe**: Fast, distraction-free IDE feel optimized for quick code scanning and reading.

## 2. Color Tokens (Dark Theme Core)
- **Background Main**: `#0F172A` (Slate 900)
- **Surface / Card**: `#1E293B` (Slate 800)
- **Surface Hover**: `#334155` (Slate 700)
- **Primary Accent**: `#38BDF8` (Sky 400 — Used for primary buttons, active tabs, and highlights)
- **Secondary Accent**: `#818CF8` (Indigo 400 — Used for badges and secondary actions)
- **Text Primary**: `#F8FAFC` (Slate 50 — High contrast headers and body)
- **Text Muted / Subtitle**: `#94A3B8` (Slate 400 — Secondary labels and metadata)
- **Code Block Background**: `#0B0F19` (Deep Charcoal)
- **Code Block Border**: `#1E293B` (Subtle 1px border)

## 3. Typography Rules
- **UI Fonts**: Inter / Roboto / System Sans-Serif.
- **Code Fonts**: Fira Code / JetBrains Mono / Monospace with clean ligatures.
- **Font Sizes**:
  - `H1 (Language Header)`: 24px Bold
  - `H2 (Topic Section)`: 18px SemiBold
  - `H3 (Cheat Sheet Title)`: 16px Medium
  - `Body / Description`: 14px Regular
  - `Code Snippet`: 13px Monospace

## 4. Key Reusable UI Components
1. **LanguageCard**: Grid/List tile featuring language SVG logo, language name, family tag (e.g., OOP, Functional, Scripting), and cheat sheet count badge.
2. **TopicTile**: Interactive category tile listing topic name, difficulty pill (Beginner / Intermediate / Advanced), and sheet count.
3. **CodeBlockWidget**: Custom container rendering syntax-highlighted code with:
   - Language header tag (e.g., `python`, `rust`).
   - One-tap **Copy Code** button with visual feedback toast.
   - Line numbers toggle.
4. **SearchBarWidget**: Sticky top search bar with real-time filtering, clear button, and filter chips.
