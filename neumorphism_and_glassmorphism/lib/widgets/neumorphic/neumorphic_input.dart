import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NeumorphicInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  const NeumorphicInput({
    super.key,
    this.controller,
    this.hintText = 'Type something...',
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.neoShadows(
          bgColor: bgColor,
          blur: 8,
          distance: 3,
          inset: true,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
