# Modern UI Showcase

An educational Flutter project that teaches **Neumorphism** and **Glassmorphism** — two modern UI design trends — built entirely with built-in Flutter widgets and **zero external packages**.

## Features

- **Neumorphism demos** — button, card, toggle, icon, slider, input field
- **Glassmorphism demos** — card, avatar, nav bar, button, dialog
- **Interactive Playground** — tweak blur, shadow distance, opacity, corner radius in real time
- **Show Code** toggle on every demo — learn the exact technique behind each widget
- **Dark mode support** — automatic system theme switching
- **Smooth fade transitions** between screens

## Architecture

```
lib/
├── main.dart                      # Entry point
├── theme/
│   └── app_theme.dart             # Color palette, neoShadows() builder
├── screens/
│   ├── home_screen.dart           # Landing page with style selection
│   ├── neumorphism_screen.dart    # All neumorphic demos
│   ├── glassmorphism_screen.dart  # All glassmorphic demos
│   ├── playground_screen.dart     # Interactive parameter playground
│   └── about_screen.dart          # Project info & credits
├── widgets/
│   ├── neumorphic/                # Neumorphism widget implementations
│   │   ├── neumorphic_button.dart
│   │   ├── neumorphic_card.dart
│   │   ├── neumorphic_toggle.dart
│   │   ├── neumorphic_icon.dart
│   │   ├── neumorphic_slider.dart
│   │   └── neumorphic_input.dart
│   └── glassmorphic/              # Glassmorphism widget implementations
│       ├── glassmorphic_card.dart
│       ├── glassmorphic_navbar.dart
│       ├── glassmorphic_avatar.dart
│       ├── glassmorphic_button.dart
│       └── glassmorphic_dialog.dart
├── common/
│   └── show_code_overlay.dart     # Expandable source-code display
└── utils/
    └── code_snippets.dart         # Source code strings for every demo
```

## How to learn from this app

1. **Browse** the Neumorphism and Glassmorphism demo pages
2. **Read** the explanation text at the top of each page
3. **Tap "Show Code"** under any widget to see its implementation
4. **Experiment** in the Interactive Playground — slide parameters and watch the preview update
5. **Compare** how the same visual properties (blur, radius) affect each style differently

## Techniques demonstrated

| Style | Core technique | Key widgets |
|---|---|---|
| Neumorphism | Dual `BoxShadow` (light + dark) | `Container`, `AnimatedContainer`, `BoxDecoration` |
| Glassmorphism | `BackdropFilter` + `ImageFilter.blur()` | `ClipRRect`, `Stack`, `AlertDialog` |

## Getting started

```bash
flutter pub get
flutter run
```

Requires Flutter SDK `^3.8.1`.

## Tests

```bash
flutter test
```

## Project

- **Version:** 1.1.0
- **Built with:** Flutter & Dart — no external UI packages
