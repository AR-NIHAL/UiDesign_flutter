import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Indigo palette
  static const Color primary = Color(0xFF3F51B5);
  static const Color primaryLight = Color(0xFF757DE8);
  static const Color primaryDark = Color(0xFF002984);
  static const Color accent = Color(0xFF7C4DFF);

  // Neumorphism base tones
  static const Color neoBgLight = Color(0xFFE8EDF2);
  static const Color neoBgDark = Color(0xFF1A1A2E);

  // Glassmorphism base
  static const Color glassWhite = Color(0xCCFFFFFF);
  static const Color glassBorder = Color(0x4DFFFFFF);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primary,
        brightness: Brightness.light,
        scaffoldBackgroundColor: neoBgLight,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: primary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: neoBgDark,
      );

  /// Builds the two neumorphic shadows: light (top-left) & dark (bottom-right).
  static List<BoxShadow> neoShadows({
    double blur = 12,
    double distance = 4,
    Color? bgColor,
    bool inset = false,
  }) {
    final Color base = bgColor ?? neoBgLight;
    final Color lightShadow = base == neoBgLight
        ? Colors.white
        : const Color(0xFF2A2A3E);
    final Color darkShadow = base == neoBgLight
        ? const Color(0xFFA3B1C6)
        : const Color(0xFF0D0D1A);

    final Offset lightOffset = inset
        ? Offset(-distance / 2, -distance / 2)
        : Offset(-distance, -distance);
    final Offset darkOffset = inset
        ? Offset(distance / 2, distance / 2)
        : Offset(distance, distance);

    return [
      BoxShadow(
        color: lightShadow,
        blurRadius: blur,
        spreadRadius: 0,
        offset: lightOffset,
        blurStyle: inset ? BlurStyle.inner : BlurStyle.normal,
      ),
      BoxShadow(
        color: darkShadow,
        blurRadius: blur,
        spreadRadius: 0,
        offset: darkOffset,
        blurStyle: inset ? BlurStyle.inner : BlurStyle.normal,
      ),
    ];
  }
}
