import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class GradientBottomNavDemo extends StatefulWidget {
  const GradientBottomNavDemo({super.key});

  @override
  State<GradientBottomNavDemo> createState() => _GradientBottomNavDemoState();
}

class _GradientBottomNavDemoState extends State<GradientBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Gradient BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (i) => setState(() => _currentIndex = i),
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor: Colors.white.withValues(alpha: 0.3),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.movie_outlined, color: Colors.white70), selectedIcon: Icon(Icons.movie, color: Colors.white), label: 'Now Showing'),
            NavigationDestination(icon: Icon(Icons.upcoming_outlined, color: Colors.white70), selectedIcon: Icon(Icons.upcoming, color: Colors.white), label: 'Coming Soon'),
            NavigationDestination(icon: Icon(Icons.star_outline, color: Colors.white70), selectedIcon: Icon(Icons.star, color: Colors.white), label: 'Top Rated'),
            NavigationDestination(icon: Icon(Icons.favorite_outline, color: Colors.white70), selectedIcon: Icon(Icons.favorite, color: Colors.white), label: 'Favorites'),
          ],
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: Colors.white, fontSize: 12);
            }
            return const TextStyle(color: Colors.white70, fontSize: 12);
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
