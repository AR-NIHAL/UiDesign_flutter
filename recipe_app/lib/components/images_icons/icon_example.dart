import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Material Icons:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _IconWithLabel(icon: Icons.home, label: 'home'),
            _IconWithLabel(icon: Icons.favorite, label: 'favorite'),
            _IconWithLabel(icon: Icons.star, label: 'star'),
            _IconWithLabel(icon: Icons.send, label: 'send'),
            _IconWithLabel(icon: Icons.settings, label: 'settings'),
            _IconWithLabel(icon: Icons.person, label: 'person'),
            _IconWithLabel(icon: Icons.search, label: 'search'),
            _IconWithLabel(icon: Icons.notifications, label: 'notifications'),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red, size: 32),
            SizedBox(width: 16),
            Icon(Icons.check_circle, color: Colors.green, size: 32),
            SizedBox(width: 16),
            Icon(Icons.warning, color: Colors.orange, size: 32),
            SizedBox(width: 16),
            Icon(Icons.info, color: Colors.blue, size: 32),
          ],
        ),
      ],
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconWithLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: Colors.deepPurple),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

const iconCode = '''// Basic icon
Icon(Icons.home, size: 28, color: Colors.deepPurple)

// Semantic icons with colors
Icon(Icons.check_circle, color: Colors.green, size: 32)
Icon(Icons.error, color: Colors.red, size: 32)
Icon(Icons.warning, color: Colors.orange, size: 32)

// Thousands of Material icons available
// Browse at: https://fonts.google.com/icons''';
