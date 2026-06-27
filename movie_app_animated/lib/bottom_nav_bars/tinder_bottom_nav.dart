import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class TinderBottomNavDemo extends StatefulWidget {
  const TinderBottomNavDemo({super.key});

  @override
  State<TinderBottomNavDemo> createState() => _TinderBottomNavDemoState();
}

class _TinderBottomNavDemoState extends State<TinderBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Discover', Icons.explore, Colors.orange),
      _buildPage('Matches', Icons.favorite, Colors.red),
      _buildPage('Messages', Icons.chat, Colors.blue),
      _buildPage('Profile', Icons.person, Colors.deepPurple),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tinder-style BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (i) {
            final icons = [Icons.explore, Icons.favorite, Icons.chat_bubble, Icons.person];
            final labels = ['Discover', 'Matches', 'Messages', 'Profile'];
            final isSelected = _currentIndex == i;
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: isSelected ? 44 : 28,
                    height: isSelected ? 44 : 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? _getColor(i).withValues(alpha: 0.1) : Colors.transparent,
                    ),
                    child: Icon(
                      icons[i],
                      size: isSelected ? 28 : 24,
                      color: isSelected ? _getColor(i) : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[i],
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected ? _getColor(i) : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Color _getColor(int i) {
    return [Colors.orange, Colors.red, Colors.blue, Colors.deepPurple][i];
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
          Text('${movieItems.length} items', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
