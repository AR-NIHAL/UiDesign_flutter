import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 250,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabs'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.phone), text: 'Calls'),
                Tab(icon: Icon(Icons.chat), text: 'Chats'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Calls Tab', style: TextStyle(fontSize: 18))),
              Center(child: Text('Chats Tab', style: TextStyle(fontSize: 18))),
              Center(child: Text('Settings Tab', style: TextStyle(fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }
}

const tabBarCode = '''// TabBar + TabBarView: swipeable tabbed interface
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      title: Text('Tabs'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.phone), text: 'Calls'),
          Tab(icon: Icon(Icons.chat), text: 'Chats'),
          Tab(icon: Icon(Icons.settings), text: 'Settings'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        Center(child: Text('Calls Tab')),
        Center(child: Text('Chats Tab')),
        Center(child: Text('Settings Tab')),
      ],
    ),
  ),
)

// Wrap in DefaultTabController or use TabController manually''';
