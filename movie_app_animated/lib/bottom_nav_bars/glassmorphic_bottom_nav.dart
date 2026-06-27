import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class GlassmorphicBottomNavDemo extends StatefulWidget {
  const GlassmorphicBottomNavDemo({super.key});

  @override
  State<GlassmorphicBottomNavDemo> createState() => _GlassmorphicBottomNavDemoState();
}

class _GlassmorphicBottomNavDemoState extends State<GlassmorphicBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Now Showing', Icons.movie, Colors.deepPurple),
      _buildPage('Coming Soon', Icons.upcoming, Colors.indigo),
      _buildPage('Top Rated', Icons.star, Colors.amber),
      _buildPage('Favorites', Icons.favorite, Colors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Glassmorphic BottomNav')),
      body: Stack(
        children: [
          pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.3))),
            ),
            child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (i) => setState(() => _currentIndex = i),
              backgroundColor: Colors.transparent,
              elevation: 0,
              indicatorColor: Colors.white.withValues(alpha: 0.4),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.movie_outlined), selectedIcon: Icon(Icons.movie), label: 'Now Showing'),
                NavigationDestination(icon: Icon(Icons.upcoming_outlined), selectedIcon: Icon(Icons.upcoming), label: 'Coming Soon'),
                NavigationDestination(icon: Icon(Icons.star_outline), selectedIcon: Icon(Icons.star), label: 'Top Rated'),
                NavigationDestination(icon: Icon(Icons.favorite_outline), selectedIcon: Icon(Icons.favorite), label: 'Favorites'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
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
      ),
    );
  }
}
