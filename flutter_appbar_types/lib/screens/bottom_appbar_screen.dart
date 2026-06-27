import 'package:flutter/material.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  bool _showFab = true;
  bool _circularNotch = true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Configuration', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Show FAB'),
            subtitle: const Text('Floating action button with notch'),
            value: _showFab,
            onChanged: (v) => setState(() => _showFab = v),
          ),
          SwitchListTile(
            title: const Text('Circular notch'),
            subtitle: const Text('Circular vs automatic notch shape'),
            value: _circularNotch,
            onChanged: (v) => setState(() => _circularNotch = v),
          ),
          const SizedBox(height: 16),
          Text('Content', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ...List.generate(
            10,
            (i) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: [
                    Colors.amber, Colors.blue, Colors.green, Colors.red,
                    Colors.purple, Colors.teal, Colors.orange, Colors.pink,
                    Colors.indigo, Colors.cyan,
                  ][i],
                  child: Text('${i + 1}'),
                ),
                title: Text('Item ${i + 1}'),
                subtitle: Text('BottomAppBar demo'),
                trailing: const Icon(Icons.star_border),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: _circularNotch ? const CircularNotchedRectangle() : null,
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? theme.colorScheme.primary : null),
              onPressed: () => setState(() => _selectedIndex = 0),
            ),
            IconButton(
              icon: Icon(Icons.favorite, color: _selectedIndex == 1 ? theme.colorScheme.primary : null),
              onPressed: () => setState(() => _selectedIndex = 1),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Icon(Icons.notifications, color: _selectedIndex == 2 ? theme.colorScheme.primary : null),
              onPressed: () => setState(() => _selectedIndex = 2),
            ),
            IconButton(
              icon: Icon(Icons.person, color: _selectedIndex == 3 ? theme.colorScheme.primary : null),
              onPressed: () => setState(() => _selectedIndex = 3),
            ),
          ],
        ),
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
