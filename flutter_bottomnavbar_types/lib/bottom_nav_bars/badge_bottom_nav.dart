import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class BadgeBottomNavDemo extends StatefulWidget {
  const BadgeBottomNavDemo({super.key});

  @override
  State<BadgeBottomNavDemo> createState() => _BadgeBottomNavDemoState();
}

class _BadgeBottomNavDemoState extends State<BadgeBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Badge BottomNav')),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: [
          NavigationDestination(
            icon: Badge(child: const Icon(Icons.movie_outlined)),
            selectedIcon: const Icon(Icons.movie),
            label: 'Now Showing',
          ),
          NavigationDestination(
            icon: Badge(label: Text('3'), child: const Icon(Icons.upcoming_outlined)),
            selectedIcon: const Icon(Icons.upcoming),
            label: 'Coming Soon',
          ),
          const NavigationDestination(
            icon: Icon(Icons.star_outline),
            selectedIcon: Icon(Icons.star),
            label: 'Top Rated',
          ),
          NavigationDestination(
            icon: Badge(label: Text('12'), child: const Icon(Icons.favorite_outline)),
            selectedIcon: const Icon(Icons.favorite),
            label: 'Favorites',
          ),
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
