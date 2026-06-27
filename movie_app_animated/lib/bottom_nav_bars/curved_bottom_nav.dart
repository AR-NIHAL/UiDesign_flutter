import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class CurvedBottomNavDemo extends StatefulWidget {
  const CurvedBottomNavDemo({super.key});

  @override
  State<CurvedBottomNavDemo> createState() => _CurvedBottomNavDemoState();
}

class _CurvedBottomNavDemoState extends State<CurvedBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Now Showing', Icons.movie, Colors.deepPurple),
      _buildPage('Coming Soon', Icons.upcoming, Colors.indigo),
      _buildPage('Home', Icons.home, Colors.orange),
      _buildPage('Top Rated', Icons.star, Colors.amber),
      _buildPage('Favorites', Icons.favorite, Colors.red),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Curved BottomNav (ClipPath)')),
      body: pages[_currentIndex],
      bottomNavigationBar: ClipPath(
        clipper: _CurvedClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, -2))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (i) {
              final icons = [Icons.movie, Icons.upcoming, Icons.home, Icons.star, Icons.favorite];
              return IconButton(
                icon: Icon(icons[i], color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey),
                onPressed: () => setState(() => _currentIndex = i),
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

class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, -10, size.width * 0.5, -10);
    path.quadraticBezierTo(size.width * 0.6, -10, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
