import 'package:flutter/material.dart';

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            8,
            (i) => Container(
              height: 80,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.shade300,
                    Colors.deepPurple.shade100,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Scrollable item ${i + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const singleChildScrollViewCode = '''// SingleChildScrollView: makes a single child scrollable
SingleChildScrollView(
  child: Column(
    children: [
      Container(height: 80, color: Colors.deepPurple),
      Container(height: 80, color: Colors.deepPurple.shade300),
      // ... more widgets that need scrolling
    ],
  ),
)

// Use when you have content that might overflow
// Works vertically by default, use scrollDirection: Axis.horizontal for horizontal''';
