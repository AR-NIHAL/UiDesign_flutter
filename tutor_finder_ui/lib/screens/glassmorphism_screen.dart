import 'package:flutter/material.dart';
import '../widgets/glassmorphic/glassmorphic_card.dart';
import '../widgets/glassmorphic/glassmorphic_navbar.dart';
import '../widgets/glassmorphic/glassmorphic_avatar.dart';

class GlassmorphismScreen extends StatelessWidget {
  const GlassmorphismScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Glassmorphism')),
      body: Container(
        // A vibrant gradient background makes the glass effect visible.
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
              'Colors.white.withOpacity(0.15))\n'
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
            Text('Glassmorphic Card',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)),
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
            const SizedBox(height: 28),
            Text('Glassmorphic Avatar',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GlassmorphicAvatar(
                  initials: 'A',
                  size: 60,
                ),
                GlassmorphicAvatar(
                  initials: 'B',
                  size: 60,
                ),
                GlassmorphicAvatar(
                  initials: 'C',
                  size: 60,
                ),
                GlassmorphicAvatar(
                  initials: 'D',
                  size: 60,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text('Glassmorphic Nav Bar (simulated)',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)),
            const SizedBox(height: 12),
            const GlassmorphicNavBar(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
