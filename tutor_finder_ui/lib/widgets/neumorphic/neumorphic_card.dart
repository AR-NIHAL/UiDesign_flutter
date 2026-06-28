import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A container with neumorphic extrusion — floats above the surface.
class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: AppTheme.neoShadows(bgColor: bgColor),
      ),
      child: child,
    );
  }
}
