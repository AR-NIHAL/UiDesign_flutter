import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class GlassmorphicDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: AlertDialog(
          backgroundColor: Colors.white.withValues(alpha: 0.18),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          title: const Text(
            'Glassmorphic Dialog',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'This dialog uses BackdropFilter to blur the content behind it. '
            'The semi-transparent background creates the frosted glass effect.',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text(
                'Got it',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
