import 'package:flutter/material.dart';
import 'package:recipe_app/core/theme.dart';

class DifficultyBadge extends StatelessWidget {
  final bool isBeginner;

  const DifficultyBadge({super.key, required this.isBeginner});

  @override
  Widget build(BuildContext context) {
    final color = isBeginner ? AppTheme.beginnerColor : AppTheme.advancedColor;
    final label = isBeginner ? 'Beginner' : 'Advanced';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
