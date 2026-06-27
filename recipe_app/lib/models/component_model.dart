import 'package:flutter/widgets.dart';

enum ComponentDifficulty { beginner, advanced }

class ComponentCategory {
  final String name;
  final String description;
  final IconData icon;

  const ComponentCategory({
    required this.name,
    required this.description,
    required this.icon,
  });
}

class ComponentItem {
  final String name;
  final String explanation;
  final ComponentCategory category;
  final ComponentDifficulty difficulty;
  final WidgetBuilder widgetBuilder;
  final String code;

  const ComponentItem({
    required this.name,
    required this.explanation,
    required this.category,
    required this.difficulty,
    required this.widgetBuilder,
    required this.code,
  });

  bool get isBeginner => difficulty == ComponentDifficulty.beginner;
}
