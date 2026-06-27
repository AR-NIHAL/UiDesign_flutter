import 'package:flutter/material.dart';

class TabBarAppBarScreen extends StatelessWidget {
  const TabBarAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar + AppBar'),
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chat'),
              Tab(icon: Icon(Icons.call), text: 'Calls'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.photo), text: 'Media'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(context, 'Chat', Icons.chat, Colors.blue),
            _buildTabContent(context, 'Calls', Icons.call, Colors.green),
            _buildTabContent(context, 'Settings', Icons.settings, Colors.purple),
            _buildTabContent(context, 'Media', Icons.photo, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, String label, IconData icon, Color color) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: color.withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(
                        'This tab demonstrates AppBar with integrated TabBar.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          8,
          (i) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.2),
                child: Icon(icon, color: color),
              ),
              title: Text('$label item ${i + 1}'),
              subtitle: Text('TabBar demo with AppBar'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ],
    );
  }
}
