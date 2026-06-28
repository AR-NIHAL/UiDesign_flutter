import 'package:flutter/material.dart';
import 'neumorphism_screen.dart';
import 'glassmorphism_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern UI Showcase'),
        centerTitle: true,
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
            // Neumorphism card
            _StyleCard(
              title: 'Neumorphism',
              subtitle: 'Soft shadows & extrusion',
              description:
                  'Neumorphism (Neo-skeuomorphism) uses dual BoxShadows — '
                  'a light shadow top-left and a dark shadow bottom-right — '
                  'to create the illusion of elements extruded from or '
                  'inset into the background.',
              icon: Icons.touch_app_outlined,
              color: const Color(0xFF7C4DFF),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NeumorphismScreen()),
              ),
            ),
            const SizedBox(height: 20),
            // Glassmorphism card
            _StyleCard(
              title: 'Glassmorphism',
              subtitle: 'Frosted glass & blur',
              description:
                  'Glassmorphism uses BackdropFilter with ImageFilter.blur() '
                  'plus a semi-transparent background to simulate frosted '
                  'glass. A subtle border and shadow complete the effect.',
              icon: Icons.blur_on_outlined,
              color: const Color(0xFF00BCD4),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GlassmorphismScreen()),
              ),
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withValues(alpha: 0.08), color.withValues(alpha: 0.02)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 32),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      Text(subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey[500])),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
