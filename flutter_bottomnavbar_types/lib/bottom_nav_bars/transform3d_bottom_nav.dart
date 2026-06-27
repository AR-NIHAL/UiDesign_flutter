import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class Transform3dBottomNavDemo extends StatefulWidget {
  const Transform3dBottomNavDemo({super.key});

  @override
  State<Transform3dBottomNavDemo> createState() => _Transform3dBottomNavDemoState();
}

class _Transform3dBottomNavDemoState extends State<Transform3dBottomNavDemo> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => AnimationController(vsync: this, duration: const Duration(milliseconds: 500)));
    _animations = _controllers.map((c) => Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: c, curve: Curves.easeOut))).toList();
    _controllers[_currentIndex].forward();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTap(int index) {
    if (index == _currentIndex) return;
    _controllers[_currentIndex].reverse();
    setState(() => _currentIndex = index);
    _controllers[index].forward();
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
      appBar: AppBar(title: const Text('3D Transform BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
            return Expanded(
              child: AnimatedBuilder(
                animation: _animations[i],
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animations[i].value * math.pi),
                    child: IconButton(
                      icon: Icon(icons[i]),
                      color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey,
                      onPressed: () => _onTap(i),
                    ),
                  );
                },
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
