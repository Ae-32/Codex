---
language: javascript
topics:
  - id: syntax
    title: Modern ES6+ Syntax
    difficulty: Beginner
  - id: async
    title: Async / Promises / Fetch
    difficulty: Intermediate
  - id: array_methods
    title: Functional Array Methods
    difficulty: Beginner
  - id: dom_events
    title: DOM Manipulation & Events
    difficulty: Intermediate
---

# JavaScript Cheat Sheet

## 1. Modern ES6+ Syntax
Essential modern JS features: arrow functions, destructuring, and spread operator.

```javascript
// Destructuring & Spread
const user = { name: "Alice", role: "Dev", level: 5 };
const { name, ...details } = user;

const nums = [1, 2, 3];
const expanded = [...nums, 4, 5];

// Optional Chaining & Nullish Coalescing
const zipCode = user?.address?.zip ?? "N/A";
```

---

## 2. Async / Promises / Fetch
Handling asynchronous operations cleanly with async/await.

```javascript
// Fetch Data with Async/Await
async function fetchCheatSheet(languageId) {
  try {
    const response = await fetch(`/api/cheatsheets/${languageId}`);
    if (!response.ok) throw new Error("Network error");
    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Failed to load:", error);
  }
}
```

---

## 3. Functional Array Methods
High-order functions: `map`, `filter`, `reduce`, `some`, `every`.

```javascript
const items = [
  { name: "Python", category: "Scripting" },
  { name: "Rust", category: "Systems" },
  { name: "SQL", category: "Database" }
];

// Map & Filter
const names = items.map(i => i.name);
const systemsLangs = items.filter(i => i.category === "Systems");

// Reduce Example
const totalChars = items.reduce((sum, item) => sum + item.name.length, 0);
```
