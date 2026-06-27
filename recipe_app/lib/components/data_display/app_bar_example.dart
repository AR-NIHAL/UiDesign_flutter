import 'package:flutter/material.dart';

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            tooltip: 'Search',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(child: Text('Settings')),
              const PopupMenuItem(child: Text('Help')),
            ],
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'AppBar with title, actions, and bottom widget',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ),
      ),
      body: const Center(child: Text('AppBar content area')),
    );
  }
}

const appBarCode = '''// AppBar with leading, title, and actions
Scaffold(
  appBar: AppBar(
    title: Text('AppBar Demo'),
    leading: Icon(Icons.arrow_back),
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
      IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
      PopupMenuButton(
        itemBuilder: (_) => [
          PopupMenuItem(child: Text('Settings')),
          PopupMenuItem(child: Text('Help')),
        ],
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(24),
      child: Text('Bottom widget'),
    ),
  ),
  body: Center(child: Text('Content')),
)''';
