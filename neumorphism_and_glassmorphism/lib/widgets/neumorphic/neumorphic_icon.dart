import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A circular icon container with neumorphic styling.
class NeumorphicIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? backgroundColor;

  const NeumorphicIcon({
    super.key,
    required this.icon,
    this.size = 56,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: AppTheme.neoShadows(
          bgColor: bgColor,
          blur: 10,
          distance: 3,
        ),
      ),
      child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: size * 0.45),
    );
  }
}
