---
language: python
topics:
  - id: syntax
    title: Variables & Basic Syntax
    difficulty: Beginner
  - id: data_structures
    title: Data Structures (Lists, Dicts, Sets)
    difficulty: Beginner
  - id: control_flow
    title: Control Flow & Loops
    difficulty: Beginner
  - id: functions
    title: Functions & Decorators
    difficulty: Intermediate
---

# Python Cheat Sheet

## 1. Variables & Basic Syntax
Python uses dynamic typing and indentation to define code blocks.

```python
# Variables & Primitive Types
name = "Codex"
version = 1.0
is_active = True
tags = ["flutter", "mobile", "cheat-sheet"]

# String Formatting (f-strings)
greeting = f"Welcome to {name} v{version}!"
print(greeting)
```

---

## 2. Data Structures
Lists, Dictionaries, Sets, and Tuples are fundamental data structures in Python.

```python
# List Comprehension
squares = [x**2 for x in range(10) if x % 2 == 0]

# Dictionary Comprehension
word_lengths = {word: len(word) for word in ["python", "rust", "sql"]}

# Unpacking
first, *middle, last = [1, 2, 3, 4, 5]
```

---

## 3. Control Flow & Loops
Conditional statements and iterator patterns.

```python
# For Loop with enumerate
for index, item in enumerate(["a", "b", "c"]):
    print(f"Index {index}: {item}")

# Pattern Matching (Python 3.10+)
command = "start"
match command:
    case "start":
        print("Engine started")
    case "stop":
        print("Engine stopped")
    case _:
        print("Unknown command")
```

---

## 4. Functions & Decorators
Defining functions, keyword arguments, and custom decorators.

```python
from typing import Callable

# Function with Type Hints
def greet(user: str, role: str = "Developer") -> str:
    return f"Hello {user} ({role})"

# Simple Timing Decorator
import time
def timer(func: Callable):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        print(f"{func.__name__} took {time.time() - start:.4f}s")
        return result
    return wrapper
```
