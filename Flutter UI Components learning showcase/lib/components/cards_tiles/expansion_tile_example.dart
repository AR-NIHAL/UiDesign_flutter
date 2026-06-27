import 'package:flutter/material.dart';

class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ExpansionTile(
            leading: Icon(Icons.settings, color: Colors.deepPurple),
            title: Text('Settings'),
            subtitle: Text('Tap to expand'),
            children: [
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                trailing: Switch(value: true, onChanged: null),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: Text('English'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Theme'),
                trailing: Text('Light'),
              ),
            ],
          ),
          const Divider(height: 1),
          ExpansionTile(
            leading: const Icon(Icons.info_outline, color: Colors.teal),
            title: const Text('About'),
            subtitle: const Text('App information'),
            initiallyExpanded: true,
            children: [
              const ListTile(
                title: Text('Version'),
                trailing: Text('1.0.0'),
              ),
              ListTile(
                title: const Text('License'),
                trailing: const Text('MIT'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const expansionTileCode = '''// Expandable tile (collapsible section)
ExpansionTile(
  leading: Icon(Icons.settings),
  title: Text('Settings'),
  subtitle: Text('Tap to expand'),
  children: [
    ListTile(/* ... */),
    ListTile(/* ... */),
  ],
)

// initiallyExpanded: starts open
ExpansionTile(
  initiallyExpanded: true,
  title: Text('About'),
  children: [/* ... */],
)''';
