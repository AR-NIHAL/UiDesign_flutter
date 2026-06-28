import 'package:flutter/material.dart';
import '../widgets/neumorphic/neumorphic_button.dart';
import '../widgets/neumorphic/neumorphic_card.dart';
import '../widgets/neumorphic/neumorphic_toggle.dart';
import '../widgets/neumorphic/neumorphic_icon.dart';
import '../widgets/neumorphic/neumorphic_slider.dart';
import '../widgets/neumorphic/neumorphic_input.dart';
import '../utils/code_snippets.dart';
import '../common/show_code_overlay.dart';

class NeumorphismScreen extends StatefulWidget {
  const NeumorphismScreen({super.key});

  @override
  State<NeumorphismScreen> createState() => _NeumorphismScreenState();
}

class _NeumorphismScreenState extends State<NeumorphismScreen> {
  bool _toggleValue = false;
  double _sliderValue = 40;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Neumorphism')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
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

          // Button
          _sectionHeader(context, 'Neumorphic Button'),
          const SizedBox(height: 12),
          const NeumorphicButton(),
          ShowCodeOverlay(code: CodeSnippets.neumorphicButton),
          const SizedBox(height: 28),

          // Card
          _sectionHeader(context, 'Neumorphic Card'),
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
          ShowCodeOverlay(code: CodeSnippets.neumorphicCard),
          const SizedBox(height: 28),

          // Toggle
          _sectionHeader(context, 'Neumorphic Toggle'),
          const SizedBox(height: 12),
          NeumorphicToggle(
            value: _toggleValue,
            onChanged: (v) => setState(() => _toggleValue = v),
          ),
          ShowCodeOverlay(code: CodeSnippets.neumorphicToggle),
          const SizedBox(height: 28),

          // Icon
          _sectionHeader(context, 'Neumorphic Icon'),
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
          ShowCodeOverlay(code: CodeSnippets.neumorphicIcon),
          const SizedBox(height: 28),

          // Slider
          _sectionHeader(context, 'Neumorphic Slider'),
          const SizedBox(height: 12),
          NeumorphicSlider(
            value: _sliderValue,
            onChanged: (v) => setState(() => _sliderValue = v),
          ),
          ShowCodeOverlay(code: CodeSnippets.neumorphicSlider),
          const SizedBox(height: 28),

          // Input
          _sectionHeader(context, 'Neumorphic Input'),
          const SizedBox(height: 12),
          const NeumorphicInput(hintText: 'Type something...'),
          ShowCodeOverlay(code: CodeSnippets.neumorphicInput),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
}
