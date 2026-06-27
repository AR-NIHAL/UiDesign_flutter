import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class AnimatedBottomNavDemo extends StatefulWidget {
  const AnimatedBottomNavDemo({super.key});

  @override
  State<AnimatedBottomNavDemo> createState() => _AnimatedBottomNavDemoState();
}

class _AnimatedBottomNavDemoState extends State<AnimatedBottomNavDemo> {
  int _currentIndex = 0;

  static const _pages = <Widget>[
    _PageContent(title: 'Now Showing', icon: Icons.movie, color: Colors.deepPurple),
    _PageContent(title: 'Coming Soon', icon: Icons.upcoming, color: Colors.indigo),
    _PageContent(title: 'Top Rated', icon: Icons.star, color: Colors.amber),
    _PageContent(title: 'Favorites', icon: Icons.favorite, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated BottomNav (animate_do)')),
      body: FadeIn(
        key: ValueKey(_currentIndex),
        duration: const Duration(milliseconds: 400),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        animationDuration: const Duration(milliseconds: 400),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.movie_outlined), selectedIcon: Icon(Icons.movie), label: 'Now Showing'),
          NavigationDestination(icon: Icon(Icons.upcoming_outlined), selectedIcon: Icon(Icons.upcoming), label: 'Coming Soon'),
          NavigationDestination(icon: Icon(Icons.star_outline), selectedIcon: Icon(Icons.star), label: 'Top Rated'),
          NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _PageContent({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('${movieItems.length} movies available', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
