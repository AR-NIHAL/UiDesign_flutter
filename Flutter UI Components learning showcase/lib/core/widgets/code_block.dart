import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          code,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 13,
            color: const Color(0xFFCDD6F4),
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
