import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class BottomAppBarNavDemo extends StatefulWidget {
  const BottomAppBarNavDemo({super.key});

  @override
  State<BottomAppBarNavDemo> createState() => _BottomAppBarNavDemoState();
}

class _BottomAppBarNavDemoState extends State<BottomAppBarNavDemo> {
  int _currentIndex = 0;

  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage(movieItems[0], 0),
      _buildPage(movieItems[1], 1),
      _buildPage(movieItems[2], 2),
      _buildPage(movieItems[3], 3),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('BottomAppBar with FAB')),
      body: pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () => _onItemTapped(0)),
            IconButton(icon: const Icon(Icons.search), onPressed: () => _onItemTapped(1)),
            const SizedBox(width: 48),
            IconButton(icon: const Icon(Icons.favorite), onPressed: () => _onItemTapped(2)),
            IconButton(icon: const Icon(Icons.person), onPressed: () => _onItemTapped(3)),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Movie movie, int index) {
    final titles = ['Home', 'Search', 'Favorites', 'Profile'];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie, size: 80, color: Colors.deepPurple.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(titles[index], style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(movie.title, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
