import 'package:flutter/material.dart';
import '../widgets/neumorphic/neumorphic_button.dart';
import '../widgets/neumorphic/neumorphic_card.dart';
import '../widgets/neumorphic/neumorphic_toggle.dart';
import '../widgets/neumorphic/neumorphic_icon.dart';

class NeumorphismScreen extends StatefulWidget {
  const NeumorphismScreen({super.key});

  @override
  State<NeumorphismScreen> createState() => _NeumorphismScreenState();
}

class _NeumorphismScreenState extends State<NeumorphismScreen> {
  bool _toggleValue = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Neumorphism')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Explanation
          Text(
            'Neumorphism (Neo-skeuomorphism) creates UI elements that appear '
            'to extrude from or be pressed into the background. The illusion '
            'relies on TWO BoxShadows:\n\n'
            '• Light shadow (top-left) — simulates a light source\n'
            '• Dark shadow (bottom-right) — simulates depth\n\n'
            'When the element is "pressed", the shadows flip inward using '
            'BlurStyle.inner, making it look concave.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 24),
          Text('Neumorphic Button',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          const NeumorphicButton(),
          const SizedBox(height: 28),
          Text('Neumorphic Card',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          NeumorphicCard(
            backgroundColor: bgColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Extruded Card',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(
                    'This card uses dual shadows to float above the surface.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Text('Neumorphic Toggle',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          NeumorphicToggle(
            value: _toggleValue,
            onChanged: (v) => setState(() => _toggleValue = v),
          ),
          const SizedBox(height: 28),
          Text('Neumorphic Icon',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              NeumorphicIcon(icon: Icons.home_outlined),
              NeumorphicIcon(icon: Icons.favorite_outline),
              NeumorphicIcon(icon: Icons.settings_outlined),
              NeumorphicIcon(icon: Icons.person_outline),
              NeumorphicIcon(icon: Icons.search_outlined),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
