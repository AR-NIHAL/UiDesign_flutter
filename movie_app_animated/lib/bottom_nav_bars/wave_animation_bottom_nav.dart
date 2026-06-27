import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class WaveAnimationBottomNavDemo extends StatefulWidget {
  const WaveAnimationBottomNavDemo({super.key});

  @override
  State<WaveAnimationBottomNavDemo> createState() => _WaveAnimationBottomNavDemoState();
}

class _WaveAnimationBottomNavDemoState extends State<WaveAnimationBottomNavDemo> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _waveController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _waveAnimation = CurvedAnimation(parent: _waveController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);
    _waveController.reset();
    _waveController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Now Showing', Icons.movie, Colors.deepPurple),
      _buildPage('Coming Soon', Icons.upcoming, Colors.indigo),
      _buildPage('Top Rated', Icons.star, Colors.amber),
      _buildPage('Favorites', Icons.favorite, Colors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Wave Animation BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
            final labels = ['Now', 'Coming', 'Rated', 'Fav'];
            final isSelected = _currentIndex == i;
            return Expanded(
              child: GestureDetector(
                onTap: () => _onTap(i),
                child: AnimatedBuilder(
                  animation: _waveAnimation,
                  builder: (context, child) {
                    double scale = 1.0;
                    if (isSelected) {
                      scale = 1.0 + (_waveAnimation.value * 0.15 * math.sin(_waveAnimation.value * math.pi * 3));
                    }
                    return Transform.scale(
                      scale: scale,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icons[i], color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey, size: isSelected ? 28 : 24),
                          const SizedBox(height: 2),
                          Text(labels[i], style: TextStyle(fontSize: 10, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPage(String title, IconData icon, Color color) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('${movieItems.length} movies', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
