import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final _pages = const [
    FeedPage(),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Practice'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),

      // Drawer is a side panel commonly attached to Scaffold. [web:1]
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings (demo)'),
              onTap: () => Navigator.pop(context),
            ),
            const AboutListTile(
              icon: Icon(Icons.info_outline),
              applicationName: 'Widget Practice',
              applicationVersion: '1.0.0',
            ),
          ],
        ),
      ),

      body: _pages[_currentIndex],

      // BottomNavigationBar is typically placed in Scaffold.bottomNavigationBar. [web:3]
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_list_outlined), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView is a common way to build a vertically scrollable screen. [web:13]
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      itemBuilder: (context, index) {
        return PostCard(
          title: 'Card item #${index + 1}',
          subtitle: 'Scrollable card with Stack + circle overlay',
        );
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const PostCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack lets you place widgets on top of each other (image + circle overlay). [web:12]
          Stack(
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/cover.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if you didn't add assets yet.
                    return Container(
                      color: Colors.indigo.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: const Icon(Icons.image_outlined, size: 48),
                    );
                  },
                ),
              ),

              // Circle overlay on top of the image (top-left).
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.92),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Icon(Icons.play_arrow_rounded),
                ),
              ),

              // Another common way is CircleAvatar for circle UI. [web:9]
              const Positioned(
                right: 12,
                bottom: 12,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
