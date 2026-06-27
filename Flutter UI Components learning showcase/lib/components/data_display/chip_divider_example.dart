import 'package:flutter/material.dart';

class ChipDividerExample extends StatelessWidget {
  const ChipDividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Chips:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              const Chip(
                avatar: Icon(Icons.tag, size: 18),
                label: Text('Flutter'),
              ),
              const Chip(
                avatar: CircleAvatar(backgroundColor: Colors.teal, child: Text('D', style: TextStyle(color: Colors.white, fontSize: 12))),
                label: Text('Dart'),
              ),
              Chip(
                label: const Text('Mobile'),
                deleteIcon: const Icon(Icons.close, size: 16),
              ),
              InputChip(
                label: const Text('Selected'),
                selected: true,
                selectedColor: Colors.deepPurple.withValues(alpha: 0.3),
              ),
              const FilterChip(
                label: Text('Filter'),
                selected: false,
                onSelected: null,
              ),
              ActionChip(
                label: const Text('Action'),
                onPressed: null,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          const Text('Divider variants:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const Divider(thickness: 2, color: Colors.deepPurple),
          const SizedBox(height: 8),
          const Text('With indent', style: TextStyle(fontSize: 12)),
          const Divider(indent: 20, endIndent: 20),
          const VerticalDividerExample(),
        ],
      ),
    );
  }
}

class VerticalDividerExample extends StatelessWidget {
  const VerticalDividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Left'),
          const VerticalDivider(width: 20, thickness: 1),
          const Text('Right'),
        ],
      ),
    );
  }
}

const chipDividerCode = '''// Chip variants
Chip(avatar: Icon(Icons.tag), label: Text('Flutter'))
InputChip(label: Text('Selected'), selected: true)
FilterChip(label: Text('Filter'), selected: false, onSelected: (v) {})
ActionChip(label: Text('Action'), onPressed: () {})

// Divider: horizontal line separator
Divider(thickness: 2, color: Colors.deepPurple)
Divider(indent: 20, endIndent: 20)  // Inset divider

// VerticalDivider: vertical line
VerticalDivider(width: 20, thickness: 1)''';
