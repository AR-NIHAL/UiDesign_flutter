import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class CustomPaintBottomNavDemo extends StatefulWidget {
  const CustomPaintBottomNavDemo({super.key});

  @override
  State<CustomPaintBottomNavDemo> createState() => _CustomPaintBottomNavDemoState();
}

class _CustomPaintBottomNavDemoState extends State<CustomPaintBottomNavDemo> {
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
      appBar: AppBar(title: const Text('CustomPaint BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: CustomPaint(
        painter: _NavBarPainter(selectedIndex: _currentIndex, color: Theme.of(context).colorScheme.primary),
        child: Container(
          height: 70,
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (i) {
              final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
              return IconButton(
                icon: Icon(icons[i], color: _currentIndex == i ? Colors.white : Colors.grey),
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

class _NavBarPainter extends CustomPainter {
  final int selectedIndex;
  final Color color;

  _NavBarPainter({required this.selectedIndex, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 8);
    path.quadraticBezierTo(0, 0, 8, 0);
    path.lineTo(size.width - 8, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 8);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black26, 4, false);
    canvas.drawPath(path, paint);

    final indicatorPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final tabWidth = size.width / 4;
    final centerX = tabWidth * selectedIndex + tabWidth / 2;

    canvas.drawCircle(Offset(centerX, size.height - 6), 4, indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant _NavBarPainter oldDelegate) =>
      oldDelegate.selectedIndex != selectedIndex;
}
