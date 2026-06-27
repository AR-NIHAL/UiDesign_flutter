import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Basic Text:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text('Hello, Flutter!'),
        const SizedBox(height: 16),
        const Text('Styled Text:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text(
          'The quick brown fox',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        const Text('Overflow handling:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: 180,
          color: Colors.grey.shade100,
          child: const Text(
            'This is a very long text that will overflow and show ellipsis',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

const textCode = '''// Basic text
Text('Hello, Flutter!')

// Styled text
Text(
  'The quick brown fox',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
    letterSpacing: 1.2,
  ),
)

// Text with overflow handling
Text(
  'Very long text that overflows',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)''';
