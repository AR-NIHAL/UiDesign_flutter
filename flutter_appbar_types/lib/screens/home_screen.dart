import 'package:flutter/material.dart';
import 'basic_appbar_screen.dart';
import 'sliver_appbar_screen.dart';
import 'flexible_space_bar_screen.dart';
import 'transparent_appbar_screen.dart';
import 'search_appbar_screen.dart';
import 'bottom_appbar_screen.dart';
import 'tabbar_appbar_screen.dart';
import 'nested_scroll_appbar_screen.dart';
import 'animated_appbar_screen.dart';
import 'custom_appbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _screens = [
    _AppBarCardData('Basic AppBar', 'M2 & M3 standard AppBar', Icons.vertical_align_top, BasicAppBarScreen()),
    _AppBarCardData('SliverAppBar', 'Collapsible with scroll', Icons.swap_vert, SliverAppBarScreen()),
    _AppBarCardData('FlexibleSpaceBar', 'Parallax background image', Icons.panorama, FlexibleSpaceBarScreen()),
    _AppBarCardData('Transparent AppBar', 'Overlay on scrollable content', Icons.opacity, TransparentAppBarScreen()),
    _AppBarCardData('Search AppBar', 'Search delegate integration', Icons.search, SearchAppBarScreen()),
    _AppBarCardData('BottomAppBar', 'Bottom bar with FAB notch', Icons.arrow_downward, BottomAppBarScreen()),
    _AppBarCardData('TabBar + AppBar', 'Integrated tab navigation', Icons.tab, TabBarAppBarScreen()),
    _AppBarCardData('NestedScrollView', 'SliverAppBar with tabs', Icons.view_carousel, NestedScrollAppBarScreen()),
    _AppBarCardData('Animated AppBar', 'Scroll-driven animations', Icons.animation, AnimatedAppBarScreen()),
    _AppBarCardData('Custom AppBar', 'PreferredSize custom layout', Icons.build, CustomAppBarScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Types'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          final data = _screens[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => data.screen),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(data.icon, size: 40, color: theme.colorScheme.primary),
                    const SizedBox(height: 12),
                    Text(
                      data.title,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;

  const _AppBarCardData(this.title, this.subtitle, this.icon, this.screen);
}
