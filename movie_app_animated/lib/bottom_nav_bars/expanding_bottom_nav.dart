import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class ExpandingBottomNavDemo extends StatefulWidget {
  const ExpandingBottomNavDemo({super.key});

  @override
  State<ExpandingBottomNavDemo> createState() => _ExpandingBottomNavDemoState();
}

class _ExpandingBottomNavDemoState extends State<ExpandingBottomNavDemo> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animController;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _anim = CurvedAnimation(parent: _animController, curve: Curves.easeOutBack);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
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
      appBar: AppBar(title: const Text('Expanding BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            final isSelected = _currentIndex == i;
            final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
            final labels = ['Now', 'Coming', 'Rated', 'Fav'];
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => _currentIndex = i);
                  _animController.reset();
                  _animController.forward();
                },
                child: AnimatedBuilder(
                  animation: _anim,
                  builder: (context, child) {
                    final scale = isSelected ? 1.0 + (_anim.value * 0.2) : 1.0;
                    return Transform.scale(
                      scale: scale,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icons[i], color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey),
                          if (isSelected)
                            Text(labels[i], style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.primary)),
                        ],
                      ),
                    );
                  },
                ),
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
