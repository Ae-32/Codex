---
language: dart
topics:
  - id: basics
    title: Variables & Null Safety
    difficulty: Beginner
  - id: functions
    title: Functions & Async/Await
    difficulty: Beginner
  - id: oop
    title: Classes, Mixins & Extensions
    difficulty: Intermediate
---

# Dart Cheat Sheet

## 1. Variables & Null Safety
Dart is a strongly typed language with sound null safety.

```dart
// Sound Null Safety
String name = "Flutter";
String? nickname; // Nullable String

// Final & Const
final currentTime = DateTime.now(); // Runtime constant
const maxItems = 100;               // Compile-time constant

// Late Initialization
late String description;
```

---

## 2. Functions & Async/Await
First-class functions with named and positional parameters.

```dart
// Named & Optional Parameters
String greet({required String user, String title = "Dev"}) {
  return "Hello $user ($title)";
}

// Async / Future
Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 1));
  return "Data loaded";
}
```

---

## 3. Classes, Mixins & Extensions
Object-oriented programming constructs.

```dart
// Mixin
mixin Logger {
  void log(String msg) => print("[LOG]: $msg");
}

// Extension Method
extension StringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
}

class AppService with Logger {
  void start() => log("Service started".capitalize);
}
```
