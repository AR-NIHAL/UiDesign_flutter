import 'package:flutter/material.dart';
import 'neumorphism_screen.dart';
import 'glassmorphism_screen.dart';
import 'playground_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern UI Showcase'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () => _navigate(context, const AboutScreen()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Text(
              'Choose a style to explore',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Learn how modern UI trends are built with pure Flutter widgets.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 2),
            _StyleCard(
              title: 'Neumorphism',
              subtitle: 'Soft shadows & extrusion',
              description:
                  'Neumorphism uses dual BoxShadows — a light shadow '
                  'top-left and a dark shadow bottom-right — to create '
                  'the illusion of elements extruded from or inset into '
                  'the background.',
              icon: Icons.touch_app_outlined,
              color: const Color(0xFF7C4DFF),
              onTap: () => _navigate(context, const NeumorphismScreen()),
            ),
            const SizedBox(height: 14),
            _StyleCard(
              title: 'Glassmorphism',
              subtitle: 'Frosted glass & blur',
              description:
                  'Glassmorphism uses BackdropFilter with ImageFilter.blur() '
                  'plus a semi-transparent background to simulate frosted '
                  'glass. A subtle border and shadow complete the effect.',
              icon: Icons.blur_on_outlined,
              color: const Color(0xFF00BCD4),
              onTap: () => _navigate(context, const GlassmorphismScreen()),
            ),
            const SizedBox(height: 14),
            _StyleCard(
              title: 'Interactive Playground',
              subtitle: 'Tweak & learn by doing',
              description:
                  'Adjust blur, shadow distance, opacity, and corner '
                  'radius in real time. See how each parameter changes '
                  'the look of both styles instantly.',
              icon: Icons.tune_outlined,
              color: const Color(0xFFFF6F00),
              onTap: () => _navigate(context, const PlaygroundScreen()),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class _StyleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _StyleCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      shadowColor: Colors.black26,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withValues(alpha: 0.08), color.withValues(alpha: 0.02)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    Text(subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey[500])),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
