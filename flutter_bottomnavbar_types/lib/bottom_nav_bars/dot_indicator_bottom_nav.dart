import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class DotIndicatorBottomNavDemo extends StatefulWidget {
  const DotIndicatorBottomNavDemo({super.key});

  @override
  State<DotIndicatorBottomNavDemo> createState() => _DotIndicatorBottomNavDemoState();
}

class _DotIndicatorBottomNavDemoState extends State<DotIndicatorBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Dot Indicator BottomNav')),
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
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icons[i], color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: isSelected ? 24 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(labels[i], style: TextStyle(fontSize: 10, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey)),
                ],
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
