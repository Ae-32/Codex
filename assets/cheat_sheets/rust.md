---
language: rust
topics:
  - id: ownership
    title: Ownership & Borrowing
    difficulty: Advanced
  - id: structs_enums
    title: Structs, Enums & Pattern Matching
    difficulty: Intermediate
  - id: error_handling
    title: Error Handling (Result & Option)
    difficulty: Intermediate
  - id: traits
    title: Traits & Generics
    difficulty: Advanced
---

# Rust Cheat Sheet

## 1. Ownership & Borrowing
Rust guarantees memory safety without a garbage collector through ownership rules.

```rust
fn main() {
    // Ownership movement
    let s1 = String::from("Codex");
    let s2 = s1; // s1 is moved here and no longer valid!

    // Immutable borrowing
    let len = calculate_length(&s2);
    
    // Mutable borrowing (only 1 mutable reference allowed at a time)
    let mut greeting = String::from("Hello");
    append_world(&mut greeting);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}

fn append_world(s: &mut String) {
    s.push_str(", World!");
}
```

---

## 2. Structs & Pattern Matching
Using Enums and `match` expressions.

```rust
enum LanguageCategory {
    Systems,
    Web,
    Database,
    Mobile(String),
}

fn describe(cat: LanguageCategory) {
    match cat {
        LanguageCategory::Systems => println!("Low-level speed & safety"),
        LanguageCategory::Web => println!("Browser & Backend ecosystem"),
        LanguageCategory::Database => println!("Data query processing"),
        LanguageCategory::Mobile(framework) => println!("Mobile via {}", framework),
    }
}
```

---

## 3. Error Handling (Result & Option)
Idiomatic error handling with `Option`, `Result`, and the `?` operator.

```rust
fn divide(a: f64, b: f64) -> Option<f64> {
    if b == 0.0 {
        None
    } else {
        Some(a / b)
    }
}

// Result handling with ? operator
fn read_config_file() -> Result<String, std::io::Error> {
    let content = std::fs::read_to_string("config.toml")?;
    Ok(content)
}
```
