// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.inbox, color: Colors.blue),
                  title: Text('Inbox'),
                  subtitle: Text('5 new messages'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.star, color: Colors.orange),
                  title: Text('Starred'),
                  subtitle: Text('2 items'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Trash'),
                  subtitle: const Text('Empty'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                const SwitchListTile(
                  title: Text('Dark mode'),
                  subtitle: Text('Enable dark theme'),
                  value: true,
                  onChanged: null,
                  secondary: Icon(Icons.dark_mode),
                ),
                const Divider(height: 1),
                const CheckboxListTile(
                  title: Text('Remember me'),
                  subtitle: Text('Stay logged in'),
                  value: false,
                  onChanged: null,
                  secondary: Icon(Icons.check_circle),
                ),
                const Divider(height: 1),
                RadioListTile<bool>(
                  title: const Text('Option A'),
                  value: true,
                  groupValue: true,
                  onChanged: null,
                  secondary: const Icon(Icons.radio_button_checked),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const listTileCode = '''// Basic ListTile with leading icon, title, subtitle, trailing
ListTile(
  leading: Icon(Icons.inbox, color: Colors.blue),
  title: Text('Inbox'),
  subtitle: Text('5 new messages'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)

// Specialized tiles: SwitchListTile, CheckboxListTile, RadioListTile
SwitchListTile(
  title: Text('Dark mode'),
  value: true,
  onChanged: (value) {},
  secondary: Icon(Icons.dark_mode),
)''';
