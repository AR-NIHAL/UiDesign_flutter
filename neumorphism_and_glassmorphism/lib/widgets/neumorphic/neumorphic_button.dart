import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A button that uses dual BoxShadows to look extruded (convex).
/// When pressed, shadows flip to inner (concave) simulating a press.
class NeumorphicButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const NeumorphicButton({
    super.key,
    this.label = 'Press Me',
    this.onPressed,
    this.width = double.infinity,
    this.height = 56,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTheme.neoShadows(
            bgColor: bgColor,
            blur: _pressed ? 8 : 16,
            distance: _pressed ? 2 : 6,
            inset: _pressed,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
