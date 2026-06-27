import 'package:flutter/material.dart';

class IconButtonExample extends StatelessWidget {
  const IconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('IconButton:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              tooltip: 'Like',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              color: Colors.blue,
              tooltip: 'Share',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.grey,
              tooltip: 'Delete',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              color: Colors.deepPurple,
              tooltip: 'Settings',
              iconSize: 32,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('With background:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Colors.red.shade200,
            ),
            const SizedBox(width: 12),
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(width: 12),
            IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.bookmark),
            ),
          ],
        ),
      ],
    );
  }
}

const iconButtonCode = '''// Simple icon button with tooltip
IconButton(
  onPressed: () {},
  icon: Icon(Icons.favorite),
  color: Colors.red,
  tooltip: 'Like',
)

// Variants: filled, filledTonal, outlined
IconButton.filled(onPressed: () {}, icon: Icon(Icons.favorite))
IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.edit))
IconButton.outlined(onPressed: () {}, icon: Icon(Icons.bookmark))''';
