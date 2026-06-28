import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.design_services_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Modern UI Showcase',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'An educational Flutter project',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'v1.1.0',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[400],
                ),
          ),
          const SizedBox(height: 32),
          _section(context, 'What is this?',
              'This app demonstrates two modern UI design trends — '
              'Neumorphism and Glassmorphism — built entirely with '
              'built-in Flutter widgets and zero external packages.'),
          _section(context, 'Neumorphism',
              'A design style that uses dual box shadows (light '
              'top-left, dark bottom-right) to create the illusion '
              'of elements extruding from or pressed into the '
              'background surface.'),
          _section(context, 'Glassmorphism',
              'A design style that creates a "frosted glass" effect '
              'using BackdropFilter with ImageFilter.blur(), '
              'semi-transparent background colors, and subtle borders.'),
          _section(context, 'Tech Stack',
              'Flutter SDK\nDart\nMaterial Design 3\n'
              'No external packages used'),
          _section(context, 'How to learn from this app',
              '1. Browse the Neumorphism and Glassmorphism demos\n'
              '2. Read the code behind each widget via "Show Code"\n'
              '3. Experiment with parameters in the Interactive Playground\n'
              '4. Compare the same component rendered in both styles'),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _section(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text(body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  )),
        ],
      ),
    );
  }
}
