import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class MultilevelBottomNavDemo extends StatefulWidget {
  const MultilevelBottomNavDemo({super.key});

  @override
  State<MultilevelBottomNavDemo> createState() => _MultilevelBottomNavDemoState();
}

class _MultilevelBottomNavDemoState extends State<MultilevelBottomNavDemo> {
  int _currentIndex = 0;

  final _subMenus = <String, List<Map<String, dynamic>>>{
    'Movies': [
      {'label': 'Now Showing', 'icon': Icons.movie, 'index': 0},
      {'label': 'Coming Soon', 'icon': Icons.upcoming, 'index': 1},
    ],
    'Browse': [
      {'label': 'Top Rated', 'icon': Icons.star, 'index': 2},
      {'label': 'Trending', 'icon': Icons.trending_up, 'index': 2},
    ],
    'Favorites': [
      {'label': 'Watchlist', 'icon': Icons.bookmark, 'index': 3},
      {'label': 'Liked', 'icon': Icons.favorite, 'index': 3},
    ],
    'Profile': [
      {'label': 'Settings', 'icon': Icons.settings, 'index': 4},
      {'label': 'Logout', 'icon': Icons.logout, 'index': 4},
    ],
  };

  final _mainIcons = [Icons.movie, Icons.explore, Icons.favorite, Icons.person];
  final _mainLabels = ['Movies', 'Browse', 'Favorites', 'Profile'];

  void _showSubMenu(BuildContext context, int index) {
    final key = _mainLabels[index];
    final items = _subMenus[key] ?? [];
    final renderBox = context.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx + (index * 80),
        position.dy - items.length * 50.0,
        position.dx + (index * 80) + 80,
        position.dy,
      ),
      items: items.map((item) {
        return PopupMenuItem<String>(
          onTap: () => setState(() => _currentIndex = item['index'] as int),
          child: Row(
            children: [
              Icon(item['icon'] as IconData, size: 20),
              const SizedBox(width: 12),
              Text(item['label'] as String),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Now Showing', Icons.movie, Colors.deepPurple),
      _buildPage('Coming Soon', Icons.upcoming, Colors.indigo),
      _buildPage('Top Rated', Icons.star, Colors.amber),
      _buildPage('Favorites', Icons.favorite, Colors.red),
      _buildPage('Profile', Icons.person, Colors.blueGrey),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Multi-level BottomNav (Long press)')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _currentIndex = i),
                onLongPress: () => _showSubMenu(context, i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_mainIcons[i], color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey),
                    const SizedBox(height: 4),
                    Text(_mainLabels[i], style: TextStyle(fontSize: 11, color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey)),
                  ],
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
