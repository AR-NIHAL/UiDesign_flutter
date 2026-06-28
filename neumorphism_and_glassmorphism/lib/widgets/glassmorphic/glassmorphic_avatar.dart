import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// A circular avatar with a glassmorphic overlay effect.
class GlassmorphicAvatar extends StatelessWidget {
  final String initials;
  final double size;

  const GlassmorphicAvatar({
    super.key,
    required this.initials,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Base circle with a subtle gradient
        Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            initials,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size * 0.35,
            ),
          ),
        ),
        // Glass overlay
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
