import 'package:flutter/material.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Center(
            child: Text(
              _pages[_selectedIndex],
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (i) => setState(() => _selectedIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
            NavigationDestination(icon: Icon(Icons.notifications), label: 'Alerts'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ],
    );
  }
}

const _pages = ['Home Page', 'Favorites Page', 'Alerts Page', 'Profile Page'];

const bottomNavBarCode = '''// NavigationBar (M3): modern bottom navigation
NavigationBar(
  selectedIndex: _selectedIndex,
  onDestinationSelected: (index) {
    setState(() => _selectedIndex = index);
  },
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
  ],
)

// Replaces the old BottomNavigationBar (M2)''';
