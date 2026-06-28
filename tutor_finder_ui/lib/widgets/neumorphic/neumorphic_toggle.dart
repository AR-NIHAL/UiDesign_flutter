import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A toggle that switches between extruded (off) and inset (on).
class NeumorphicToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const NeumorphicToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;
    final accent = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80,
        height: 44,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(22),
          boxShadow: AppTheme.neoShadows(
            bgColor: bgColor,
            blur: 10,
            distance: 4,
            inset: value, // inset when active
          ),
        ),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.all(4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: value ? accent : bgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: value
                ? []
                : AppTheme.neoShadows(bgColor: bgColor, blur: 6, distance: 2),
          ),
        ),
      ),
    );
  }
}
