import 'package:flutter/material.dart';

class MaterialButtonsExample extends StatelessWidget {
  const MaterialButtonsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _ButtonRow(
          label: 'ElevatedButton',
          child: ElevatedButton(
            onPressed: null,
            child: Text('Disabled'),
          ),
        ),
        const SizedBox(height: 8),
        const _ButtonRow(
          label: 'ElevatedButton',
          child: ElevatedButton(
            onPressed: _dummy,
            child: Text('Active'),
          ),
        ),
        const SizedBox(height: 8),
        const _ButtonRow(
          label: 'TextButton',
          child: TextButton(
            onPressed: _dummy,
            child: Text('Text Button'),
          ),
        ),
        const SizedBox(height: 8),
        const _ButtonRow(
          label: 'OutlinedButton',
          child: OutlinedButton(
            onPressed: _dummy,
            child: Text('Outlined'),
          ),
        ),
      ],
    );
  }
}

class _ButtonRow extends StatelessWidget {
  final String label;
  final Widget child;

  const _ButtonRow({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
        child,
      ],
    );
  }
}

void _dummy() {}

const materialButtonsCode = '''// ElevatedButton: filled button with shadow (primary action)
ElevatedButton(
  onPressed: () { /* action */ },
  child: Text('Button'),
)

// TextButton: flat text button (secondary action)
TextButton(
  onPressed: () { /* action */ },
  child: Text('Text Button'),
)

// OutlinedButton: button with border (medium emphasis)
OutlinedButton(
  onPressed: () { /* action */ },
  child: Text('Outlined'),
)''';
