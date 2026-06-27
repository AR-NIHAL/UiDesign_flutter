import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer Demo'),
          leading: Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(ctx).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, color: Colors.white, size: 36),
                    ),
                    SizedBox(height: 8),
                    Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('john@example.com', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () => Navigator.pop(context),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: const Center(child: Text('Tap the menu icon to open the drawer')),
      ),
    );
  }
}

const drawerCode = '''// Drawer: slide-in navigation panel
Scaffold(
  appBar: AppBar(
    leading: Builder(
      builder: (ctx) => IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Scaffold.of(ctx).openDrawer(),
      ),
    ),
  ),
  drawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.deepPurple),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(child: Icon(Icons.person)),
              Text('John Doe'),
              Text('john@example.com'),
            ],
          ),
        ),
        ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () {}),
        ListTile(leading: Icon(Icons.settings), title: Text('Settings'), onTap: () {}),
      ],
    ),
  ),
)''';
