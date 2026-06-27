import 'package:flutter/material.dart';

class ConstrainedBoxExample extends StatelessWidget {
  const ConstrainedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('ConstrainedBox (min/max size):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 250,
            minHeight: 50,
            maxHeight: 100,
          ),
          child: Container(
            color: Colors.deepPurple.shade100,
            alignment: Alignment.center,
            child: const Text('Constrained 100-250w x 50-100h'),
          ),
        ),
        const SizedBox(height: 20),
        const Text('AspectRatio (16:9):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: 250,
          color: Colors.grey.shade200,
          child: const AspectRatio(
            aspectRatio: 16 / 9,
            child: Card(
              color: Colors.teal,
              child: Center(
                child: Text('16:9', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const constrainedBoxCode = '''// ConstrainedBox: limits child size
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 100, maxWidth: 250,
    minHeight: 50, maxHeight: 100,
  ),
  child: Container(color: Colors.deepPurple.shade100),
)

// AspectRatio: maintains a width/height ratio
AspectRatio(
  aspectRatio: 16 / 9,
  child: Card(child: Center(child: Text('16:9'))),
)''';
