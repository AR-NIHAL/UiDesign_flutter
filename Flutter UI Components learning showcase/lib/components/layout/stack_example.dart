import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('Overlay', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Stack',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const stackCode = '''Stack(
  children: [
    // Background layer
    Container(color: Colors.blue.shade200),
    // Top-left overlay
    Positioned(
      top: 20, left: 20,
      child: Container(width: 80, height: 80, color: Colors.deepPurple),
    ),
    // Bottom-right overlay  
    Positioned(
      bottom: 20, right: 20,
      child: Container(width: 100, height: 60, color: Colors.orange),
    ),
    // Centered text
    Center(child: Text('Stack')),
  ],
)''';
