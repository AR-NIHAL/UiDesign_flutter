import 'package:flutter/material.dart';

class WrapFittedBoxExample extends StatelessWidget {
  const WrapFittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Wrap (auto-wraps children):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: 220,
          color: Colors.blue.shade50,
          child: const Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _Chip('Flutter'),
              _Chip('Dart'),
              _Chip('Widgets'),
              _Chip('UI Design'),
              _Chip('Mobile'),
              _Chip('Cross-platform'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('FittedBox (scale to fit):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 50,
          color: Colors.orange.shade50,
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text('This text scales to fit!', style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

const wrapFittedBoxCode = '''// Wrap: children flow to next line when overflow
Wrap(
  spacing: 8,    // horizontal gap
  runSpacing: 4, // vertical gap
  children: [/* ... */],
)

// FittedBox: scales child to fit parent
FittedBox(
  fit: BoxFit.contain,
  child: Text('Scales to fit!'),
)''';
