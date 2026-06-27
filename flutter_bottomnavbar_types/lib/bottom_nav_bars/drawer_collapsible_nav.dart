import 'package:flutter/material.dart';
import 'package:movie_app_animated/model.dart';

class DrawerCollapsibleNavDemo extends StatefulWidget {
  const DrawerCollapsibleNavDemo({super.key});

  @override
  State<DrawerCollapsibleNavDemo> createState() => _DrawerCollapsibleNavDemoState();
}

class _DrawerCollapsibleNavDemoState extends State<DrawerCollapsibleNavDemo> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isExpanded = false;
  late AnimationController _animController;
  late Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_isExpanded) {
      _animController.reverse();
    } else {
      _animController.forward();
    }
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildPage('Now Showing', Icons.movie, Colors.deepPurple),
      _buildPage('Coming Soon', Icons.upcoming, Colors.indigo),
      _buildPage('Top Rated', Icons.star, Colors.amber),
      _buildPage('Favorites', Icons.favorite, Colors.red),
    ];

    final drawerItems = [
      {'icon': Icons.movie, 'label': 'Now Showing', 'index': 0},
      {'icon': Icons.upcoming, 'label': 'Coming Soon', 'index': 1},
      {'icon': Icons.star, 'label': 'Top Rated', 'index': 2},
      {'icon': Icons.favorite, 'label': 'Favorites', 'index': 3},
      {'icon': Icons.settings, 'label': 'Settings', 'index': 0},
      {'icon': Icons.info, 'label': 'About', 'index': 0},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Drawer-collapsible BottomNav')),
      body: pages[_currentIndex],
      bottomNavigationBar: AnimatedBuilder(
        animation: _expandAnim,
        builder: (context, child) {
          final drawerHeight = 70.0 + (_expandAnim.value * 300);
          return Container(
            height: drawerHeight,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, -2))],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (i) {
                      final icons = [Icons.movie, Icons.upcoming, Icons.star, Icons.favorite];
                      final labels = ['Now', 'Coming', 'Rated', 'Fav'];
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _currentIndex = i),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icons[i], color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey),
                              Text(labels[i], style: TextStyle(fontSize: 10, color: _currentIndex == i ? Theme.of(context).colorScheme.primary : Colors.grey)),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (_expandAnim.value > 0.1)
                  Opacity(
                    opacity: _expandAnim.value,
                    child: SizedBox(
                      height: 300 * _expandAnim.value,
                      child: Column(
                        children: drawerItems.map((item) {
                          final i = item['index'] as int;
                          return ListTile(
                            dense: true,
                            leading: Icon(item['icon'] as IconData, color: Theme.of(context).colorScheme.primary),
                            title: Text(item['label'] as String, style: const TextStyle(fontSize: 14)),
                            onTap: () {
                              setState(() => _currentIndex = i);
                              _toggleDrawer();
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: _toggleDrawer,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: _expandAnim,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
