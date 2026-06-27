import 'package:flutter/material.dart';
import 'package:movie_app_animated/bottom_nav_bars/standard_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/bottom_app_bar_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/cupertino_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/animated_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/badge_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/gradient_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/curved_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/glassmorphic_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/expanding_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/custom_paint_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/neumorphic_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/transform3d_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/tinder_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/ripple_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/dot_indicator_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/smooth_slide_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/wave_animation_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/multilevel_bottom_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/drawer_collapsible_nav.dart';
import 'package:movie_app_animated/bottom_nav_bars/segmented_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _items = [
    _NavItem('Standard', 'Classic Material BottomNavigationBar', Icons.explore, StandardBottomNavDemo()),
    _NavItem('BottomAppBar', 'BottomAppBar with FAB + notch', Icons.add_circle, BottomAppBarNavDemo()),
    _NavItem('Cupertino', 'iOS-style CupertinoTabBar', Icons.phone_iphone, CupertinoBottomNavDemo()),
    _NavItem('Animated', 'Scale/fade transitions with animate_do', Icons.animation, AnimatedBottomNavDemo()),
    _NavItem('Badge', 'Badge/notification indicators', Icons.notifications, BadgeBottomNavDemo()),
    _NavItem('Gradient', 'Gradient background on bar', Icons.gradient, GradientBottomNavDemo()),
    _NavItem('Curved', 'ClipPath curved/convex shape', Icons.auto_graph, CurvedBottomNavDemo()),
    _NavItem('Glassmorphic', 'Glass/blur via BackdropFilter', Icons.blur_on, GlassmorphicBottomNavDemo()),
    _NavItem('Expanding', 'Items expand on selection', Icons.expand_less, ExpandingBottomNavDemo()),
    _NavItem('CustomPaint', 'Fully custom shape via CustomPainter', Icons.brush, CustomPaintBottomNavDemo()),
    _NavItem('Neumorphic', 'Soft UI shadows (emboss/deboss)', Icons.view_quilt, NeumorphicBottomNavDemo()),
    _NavItem('3D Transform', '3D rotation on active tab', Icons.threed_rotation, Transform3dBottomNavDemo()),
    _NavItem('Tinder-style', 'Circular icon-only navigation', Icons.favorite, TinderBottomNavDemo()),
    _NavItem('Ripple', 'Material ripple/reveal on tap', Icons.waves, RippleBottomNavDemo()),
    _NavItem('Dot Indicator', 'Dots instead of labels', Icons.more_horiz, DotIndicatorBottomNavDemo()),
    _NavItem('Smooth Slide', 'Active indicator slides smoothly', Icons.slideshow, SmoothSlideBottomNavDemo()),
    _NavItem('Wave', 'Wave effect on active tab', Icons.water, WaveAnimationBottomNavDemo()),
    _NavItem('Multi-level', 'Sub-menu on long press', Icons.menu_open, MultilevelBottomNavDemo()),
    _NavItem('Drawer-collapsible', 'Bar expands into a drawer', Icons.vertical_split, DrawerCollapsibleNavDemo()),
    _NavItem('Segmented', 'Segmented control at bottom', Icons.tab, SegmentedBottomNavDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Nav Bar Collection'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Icon(item.icon, color: Theme.of(context).colorScheme.primary),
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _NavItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;
  const _NavItem(this.title, this.subtitle, this.icon, this.screen);
}
