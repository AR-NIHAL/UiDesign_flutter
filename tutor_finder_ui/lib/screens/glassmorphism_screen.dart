import 'package:flutter/material.dart';
import '../widgets/glassmorphic/glassmorphic_card.dart';
import '../widgets/glassmorphic/glassmorphic_navbar.dart';
import '../widgets/glassmorphic/glassmorphic_avatar.dart';
import '../widgets/glassmorphic/glassmorphic_button.dart';
import '../widgets/glassmorphic/glassmorphic_dialog.dart';
import '../utils/code_snippets.dart';
import '../common/show_code_overlay.dart';

class GlassmorphismScreen extends StatelessWidget {
  const GlassmorphismScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Glassmorphism')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
              Color(0xFF4facfe),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Glassmorphism uses:\n\n'
              '1. BackdropFilter + ImageFilter.blur() — blurs everything '
              'behind the widget\n'
              '2. Semi-transparent background (e.g. '
              'Colors.white.withValues(alpha: 0.15))\n'
              '3. A subtle border with low opacity\n'
              '4. A light shadow for depth\n\n'
              'The result is a "frosted glass" effect that reveals the '
              'background gradient through the blur.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                    height: 1.6,
                  ),
            ),
            const SizedBox(height: 24),

            // Card
            _sectionHeader(context, 'Glassmorphic Card'),
            const SizedBox(height: 12),
            const GlassmorphicCard(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frosted Glass Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'The background gradient shows through the blurred surface.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            _whiteCodeOverlay(context, CodeSnippets.glassmorphicCard),
            const SizedBox(height: 28),

            // Avatar
            _sectionHeader(context, 'Glassmorphic Avatar'),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlassmorphicAvatar(initials: 'A', size: 60),
                GlassmorphicAvatar(initials: 'B', size: 60),
                GlassmorphicAvatar(initials: 'C', size: 60),
                GlassmorphicAvatar(initials: 'D', size: 60),
              ],
            ),
            _whiteCodeOverlay(context, CodeSnippets.glassmorphicAvatar),
            const SizedBox(height: 28),

            // Nav Bar
            _sectionHeader(context, 'Glassmorphic Nav Bar'),
            const SizedBox(height: 12),
            const GlassmorphicNavBar(),
            _whiteCodeOverlay(context, CodeSnippets.glassmorphicNavbar),
            const SizedBox(height: 28),

            // Button
            _sectionHeader(context, 'Glassmorphic Button'),
            const SizedBox(height: 12),
            GlassmorphicButton(
              label: 'Glass Button',
              onPressed: () {},
            ),
            _whiteCodeOverlay(context, CodeSnippets.glassmorphicButton),
            const SizedBox(height: 28),

            // Dialog
            _sectionHeader(context, 'Glassmorphic Dialog'),
            const SizedBox(height: 12),
            GlassmorphicButton(
              label: 'Open Glass Dialog',
              onPressed: () => GlassmorphicDialog.show(context),
            ),
            _whiteCodeOverlay(context, CodeSnippets.glassmorphicDialog),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white));
  }

  Widget _whiteCodeOverlay(BuildContext context, String code) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ShowCodeOverlay(code: code),
    );
  }
}
