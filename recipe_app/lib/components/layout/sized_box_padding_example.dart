import 'package:flutter/material.dart';

class SizedBoxPaddingExample extends StatelessWidget {
  const SizedBoxPaddingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('SizedBox (fixed size):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SizedBox(
          width: 180,
          height: 50,
          child: Container(
            color: Colors.deepPurple.shade100,
            alignment: Alignment.center,
            child: const Text('180 x 50'),
          ),
        ),
        const SizedBox(height: 24),
        const Text('Padding (inner spacing):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          color: Colors.orange.shade100,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text('16px padding on all sides'),
          ),
        ),
        const SizedBox(height: 24),
        const Text('EdgeInsets (directional):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          color: Colors.teal.shade50,
          child: const Padding(
            padding: EdgeInsets.only(left: 24, top: 12, right: 8, bottom: 12),
            child: Text('left:24 top:12 right:8 bottom:12'),
          ),
        ),
      ],
    );
  }
}

const sizedBoxPaddingCode = '''// SizedBox: fixed width and/or height
SizedBox(
  width: 180,
  height: 50,
  child: Container(color: Colors.deepPurple.shade100),
)

// Padding: adds inner space around child
Padding(
  padding: EdgeInsets.all(16),
  child: Text('16px padding on all sides'),
)

// Directional padding
Padding(
  padding: EdgeInsets.only(left: 24, top: 12, right: 8, bottom: 12),
  child: Text('Custom padding'),
)''';
