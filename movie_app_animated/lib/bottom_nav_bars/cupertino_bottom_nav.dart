import 'package:flutter/cupertino.dart';
import 'package:movie_app_animated/model.dart';

class CupertinoBottomNavDemo extends StatefulWidget {
  const CupertinoBottomNavDemo({super.key});

  @override
  State<CupertinoBottomNavDemo> createState() => _CupertinoBottomNavDemoState();
}

class _CupertinoBottomNavDemoState extends State<CupertinoBottomNavDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final labels = ['Now Showing', 'Coming Soon', 'Top Rated', 'Favorites'];
    final icons = <IconData>[
      CupertinoIcons.play_rectangle,
      CupertinoIcons.clock,
      CupertinoIcons.star,
      CupertinoIcons.heart,
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: List.generate(4, (i) => BottomNavigationBarItem(icon: Icon(icons[i]), label: labels[i])),
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(labels[index])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons[index], size: 80, color: CupertinoColors.activeBlue.withValues(alpha: 0.3)),
                const SizedBox(height: 16),
                Text(labels[index], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('${movieItems.length} movies', style: TextStyle(color: CupertinoColors.systemGrey)),
              ],
            ),
          ),
        );
      },
    );
  }
}
