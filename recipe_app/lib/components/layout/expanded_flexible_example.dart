import 'package:flutter/material.dart';

class ExpandedFlexibleExample extends StatelessWidget {
  const ExpandedFlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Expanded (equal proportions):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          height: 60,
          color: Colors.grey.shade200,
          child: const Row(
            children: [
              Expanded(
                flex: 1,
                child: _ColoredBox('1', Colors.red),
              ),
              Expanded(
                flex: 2,
                child: _ColoredBox('2', Colors.green),
              ),
              Expanded(
                flex: 1,
                child: _ColoredBox('1', Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Flexible (wraps content):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          height: 60,
          color: Colors.grey.shade200,
          child: Row(
            children: [
              const Flexible(
                flex: 1,
                child: _ColoredBox('Flex', Colors.orange),
              ),
              Container(
                width: 80,
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text('Fixed',
                    style: TextStyle(color: Colors.white)),
              ),
              const Flexible(
                flex: 1,
                child: _ColoredBox('Flex', Colors.teal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColoredBox extends StatelessWidget {
  final String label;
  final Color color;

  const _ColoredBox(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

const expandedFlexibleCode = '''// Expanded fills available space proportionally
Row(
  children: [
    Expanded(flex: 1, child: ...), // 25%
    Expanded(flex: 2, child: ...), // 50%
    Expanded(flex: 1, child: ...), // 25%
  ],
)

// Flexible allows child to be smaller than available space
Row(
  children: [
    Flexible(flex: 1, child: ...), // Takes remaining space
    SizedBox(width: 80, child: ...), // Fixed width
    Flexible(flex: 1, child: ...), // Takes remaining space
  ],
)''';
