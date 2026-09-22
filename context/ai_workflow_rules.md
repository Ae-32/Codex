# AI Workflow Rules — Codex

## 1. Roles & Responsibilities
- **User (Architect)**: Defines features, reviews plans, tests implementation, and approves completed units.
- **AI Agent (Implementation Engine)**: Reads context files, presents unit plans before editing code, writes clean code, and verifies execution against unit exit criteria.

## 2. Unit-Based Execution Rules
1. **Context First**: Before starting any unit, the AI MUST inspect all 6 files in `/context` to ensure strict compliance with system rules.
2. **Plan Before Code**: For every unit, the AI MUST provide a detailed implementation plan and receive approval before modifying or generating code.
3. **Incremental Changes**: Make modular, incremental updates. Do not attempt massive multi-feature rewrites in a single step.
4. **Verification Requirement**: Never mark a unit as `[Done]` in `progress_tracker.md` without executing verification tests and verifying zero build errors.

## 3. Strict "No Guessing" Policy
- If a requirement, design detail, or edge case is ambiguous, the AI MUST stop and ask clarifying questions instead of making arbitrary assumptions.
- The AI MUST NEVER create unauthorized dependencies, alter project architecture, or break System Invariants defined in `architecture.md`.
