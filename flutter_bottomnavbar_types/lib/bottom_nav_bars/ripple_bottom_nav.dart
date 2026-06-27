import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class RippleBottomNavDemo extends StatefulWidget {
  const RippleBottomNavDemo({super.key});

  @override
  State<RippleBottomNavDemo> createState() => _RippleBottomNavDemoState();
}

class _RippleBottomNavDemoState extends State<RippleBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Ripple/Reveal BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Material(
        elevation: 4,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (i) {
              final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
              final labels = ['Now', 'Coming', 'Rated', 'Fav'];
              final isSelected = _currentIndex == i;
              return Expanded(
                child: InkWell(
                  onTap: () => setState(() => _currentIndex = i),
                  splashColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  highlightColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[i], color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey, size: 26),
                        Text(labels[i], style: TextStyle(fontSize: 10, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey)),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
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
