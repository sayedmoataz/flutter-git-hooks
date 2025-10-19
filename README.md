# 🪝 Flutter Git Hooks Automation with Lefthook

[![Built with Flutter](https://img.shields.io/badge/Built%20with-Flutter-02569B?logo=flutter\&logoColor=white)](https://flutter.dev)
[![Powered by Lefthook](https://img.shields.io/badge/Powered%20by-Lefthook-2C8EBB?logo=git\&logoColor=white)](https://github.com/evilmartians/lefthook)
[![Automated Code Quality](https://img.shields.io/badge/Automated-Code%20Quality-success?logo=github-actions\&logoColor=white)](#)

Automate your Flutter project's code quality checks, formatting, and testing with **Lefthook** and **Dart scripts**.
This setup ensures your team maintains consistent, clean, and tested code before it ever reaches production branches.

---

## 🔄 Git Flow with Hooks

```
        ┌──────────────────────────┐
        │   Developer writes code  │
        └────────────┬─────────────┘
                     │
                     ▼
          ┌────────────────────┐
          │   git commit       │
          └────────────────────┘
                     │
        ┌────────────┴─────────────┐
        │     pre-commit hook      │
        │  → format + sort imports │
        └────────────┬─────────────┘
                     │
                     ▼
          ┌────────────────────┐
          │   commit-msg hook  │
          │  → check message   │
          └────────────────────┘
                     │
                     ▼
          ┌────────────────────┐
          │     git push       │
          └────────────────────┘
                     │
        ┌────────────┴─────────────┐
        │       pre-push hook      │
        │ → analyze + run tests    │
        └────────────┬─────────────┘
                     │
                     ▼
        ┌──────────────────────────┐
        │ Merge / release branch   │
        │ → post-merge hook runs   │
        └──────────────────────────┘
```

---

## 🚀 Overview

This repository provides a **ready-to-use Lefthook configuration** for Flutter projects that:

* Automatically formats Dart files and sorts imports before committing.
* Enforces **Conventional Commit** message style.
* Runs static analysis and unit tests before pushing code.
* Updates dependencies automatically after merges.
* Includes a one-command setup script for quick installation.

Perfect for teams working across different IDEs and environments — ensuring everyone follows the same standards effortlessly.

---

## 🧩 Features

### ✅ Pre-commit

* Runs `dart format` with a 120-character line limit.
* Sorts imports using `import_sorter`.
* Ensures `pubspec.yaml` dependencies are up to date.

### 🚀 Pre-push

* Runs `flutter analyze` on every branch.
* Executes the **full test suite** on production branches (`main`, `master`, `release/*`, etc.).
* Gives non-blocking test warnings on dev branches.

### 📝 Commit-msg

* Enforces **Conventional Commit** format:

  ```
  type(scope?): subject
  ```

  **Examples:**

  * `feat(auth): add login functionality`
  * `fix(ui): resolve button alignment issue`
  * `docs: update README`

  **Valid types:**
  `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`, `revert`

### 🔄 Post-merge / Post-checkout

* Runs `flutter pub get` after merges.
* Reinstalls hooks automatically when switching branches.

---

## ⚙️ Installation

Clone the repository and run the setup script:

```bash
dart run setup_hooks.dart
```

This will:

1. Install **lefthook_dart** globally.
2. Fetch project dependencies.
3. Install Git hooks.
4. Format and sort imports across the project.

Once done, Lefthook will automatically run the relevant checks on each commit or push.

---

## 📁 File Structure

```
.
├── lefthook.yml          # Main Git Hooks configuration
├── setup_hooks.dart      # One-command setup script
├── pubspec.yaml          # Dev dependencies and import_sorter config
└── README.md             # Project documentation
```

---

## 🧪 Running Manually

You can run hooks manually for testing:

```bash
lefthook run pre-commit
lefthook run pre-push
lefthook run commit-msg
```

---

## 🧠 How It Helps

* Keeps code **formatted, analyzed, and tested** automatically.
* Detects **deprecated APIs, unused functions/imports, and naming issues** early.
* Saves reviewers’ time by enforcing a unified style.
* Makes high-quality code the **default**, not an afterthought.

---

## 💡 Tips

* Always write meaningful commit messages using the conventional format.
* If a pre-push test fails on a production branch, fix it locally before pushing again.
* Run `lefthook install` again if hooks stop working after a Git re-clone.

---

## 🧰 Dependencies

```yaml
dev_dependencies:
  lefthook_dart: ^1.0.8
  import_sorter: ^4.6.0
```

---

## 🧩 Demo & Example Output

### 📝 Invalid Commit Message

If you try to commit with a message like `update stuff`, you’ll see:

```
❌ Commit message must follow conventional commits format:
   type(scope?): subject

   Examples:
   - feat(auth): add login functionality
   - fix(ui): resolve button alignment issue
   - docs: update README

   Valid types: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert
```

---

### 🧪 Pre-push Tests

When pushing to a production branch (`main` or `release/*`):

```
Running hook: pre-push > analyze
Analyzing project...
✔ No issues found!

Running hook: pre-push > test-production
00:01 +25: All tests passed! ✅
```

If tests fail:

```
❌ Tests failed!
Production branch requires all tests to pass.
Fix the failing tests before pushing to production.
```

---

### 🔍 Flutter Analyze Example

When `flutter analyze` detects deprecated APIs or unused imports:

```
Analyzing lib/...
warning • 'FlatButton' is deprecated and shouldn't be used. • lib/widgets/login_button.dart:12:10
warning • Unused import: 'package:my_app/utils/helpers.dart'. • lib/screens/home.dart:4:8

2 issues found. Fix them before pushing.
```

---

## 🏷️ License

MIT License © 2025 — You’re free to use, modify, and share this setup.

---

## 🌟 Acknowledgements

Inspired by the need for cleaner, more automated Flutter team workflows.
Built with ❤️ using **Dart**, **Lefthook**, and **Flutter tooling**.

---

## 🧱 Built With

| Tool                                                       | Purpose                        |
| ---------------------------------------------------------- | ------------------------------ |
| 🐦 [Flutter](https://flutter.dev)                          | App framework & codebase       |
| 💡 [Lefthook](https://github.com/evilmartians/lefthook)    | Git hooks management           |
| 🧹 [import_sorter](https://pub.dev/packages/import_sorter) | Import organization            |
| 🧰 [lefthook_dart](https://pub.dev/packages/lefthook_dart) | Dart integration with Lefthook |
| ⚙️ Dart CLI                                                | Setup automation script        |

