import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class SmoothSlideBottomNavDemo extends StatefulWidget {
  const SmoothSlideBottomNavDemo({super.key});

  @override
  State<SmoothSlideBottomNavDemo> createState() => _SmoothSlideBottomNavDemoState();
}

class _SmoothSlideBottomNavDemoState extends State<SmoothSlideBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Smooth Slide Indicator')),
      body: pages[_currentIndex],
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / 4;
          return Container(
            height: 70,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic,
                  left: tabWidth * _currentIndex,
                  top: 0,
                  width: tabWidth,
                  height: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(4, (i) {
                    final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
                    final labels = ['Now', 'Coming', 'Rated', 'Fav'];
                    final isSelected = _currentIndex == i;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _currentIndex = i),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 8),
                            Icon(icons[i], color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey),
                            const SizedBox(height: 4),
                            Text(labels[i], style: TextStyle(fontSize: 11, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey)),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
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
