import 'package:flutter/material.dart';

class CenterAlignExample extends StatelessWidget {
  const CenterAlignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Center widget:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          height: 80,
          color: Colors.blue.shade50,
          child: const Center(
            child: Text('Perfectly centered', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Align widget:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          height: 100,
          color: Colors.green.shade50,
          child: const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text('Bottom-Right', style: TextStyle(fontSize: 14)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 60,
          color: Colors.orange.shade50,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Center Left'),
            ),
          ),
        ),
      ],
    );
  }
}

const centerAlignCode = '''// Center: perfectly centers child
Center(
  child: Text('Perfectly centered'),
)

// Align: positions child using alignment property
Align(
  alignment: Alignment.bottomRight,
  child: Text('Bottom-Right'),
)

Align(
  alignment: Alignment.centerLeft,
  child: Text('Center Left'),
)''';
