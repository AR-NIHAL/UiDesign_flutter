import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class SegmentedBottomNavDemo extends StatefulWidget {
  const SegmentedBottomNavDemo({super.key});

  @override
  State<SegmentedBottomNavDemo> createState() => _SegmentedBottomNavDemoState();
}

class _SegmentedBottomNavDemoState extends State<SegmentedBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Segmented BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Row(
            children: List.generate(4, (i) {
              final isSelected = _currentIndex == i;
              final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
              final labels = ['Now', 'Coming', 'Rated', 'Fav'];
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _currentIndex = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.all(isSelected ? 2 : 0),
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[i], size: isSelected ? 20 : 18, color: isSelected ? Theme.of(context).colorScheme.onPrimaryContainer : Colors.grey),
                        if (isSelected) ...[
                          const SizedBox(width: 4),
                          Text(labels[i], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                        ],
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
