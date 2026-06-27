import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class NeumorphicBottomNavDemo extends StatefulWidget {
  const NeumorphicBottomNavDemo({super.key});

  @override
  State<NeumorphicBottomNavDemo> createState() => _NeumorphicBottomNavDemoState();
}

class _NeumorphicBottomNavDemoState extends State<NeumorphicBottomNavDemo> {
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
      appBar: AppBar(title: const Text('Neumorphic BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E5EC),
          boxShadow: [
            BoxShadow(color: Colors.white.withValues(alpha: 0.8), blurRadius: 10, offset: const Offset(-4, -4)),
            BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(4, 4)),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (i) {
              final isSelected = _currentIndex == i;
              final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
              return Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE0E5EC),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 6, offset: const Offset(3, 3)),
                          BoxShadow(color: Colors.white.withValues(alpha: 0.8), blurRadius: 6, offset: const Offset(-3, -3)),
                        ]
                      : [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(4, 4)),
                          BoxShadow(color: Colors.white, blurRadius: 8, offset: const Offset(-4, -4)),
                        ],
                ),
                child: IconButton(
                  icon: Icon(icons[i]),
                  color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
                  onPressed: () => setState(() => _currentIndex = i),
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
