import 'package:flutter/material.dart';

class TutorDirScreen extends StatefulWidget {
  const TutorDirScreen({super.key});

  @override
  State<TutorDirScreen> createState() => _TutorDirScreenState();
}

class _TutorDirScreenState extends State<TutorDirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  SearchBar(),
                  SizedBox(height: 20),
                  FilterButtonsRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------
// Sliver AppBar
// -----------------------------
class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.deepPurpleAccent[400],
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: Colors.pinkAccent),
        title: const Text(
          "Tutor Finder",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// -----------------------------
// App Drawer
// -----------------------------
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text(
              "Ashikur Rahman",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved Tutors'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

// -----------------------------
// Search Bar
// -----------------------------
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.indigo.shade200, width: 2),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'SEARCH FOR TUTOR...',
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }
}

// -----------------------------
// Filter Buttons Row
// -----------------------------
class FilterButtonsRow extends StatelessWidget {
  const FilterButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filters = [
      {'label': 'SUBJECT', 'icon': Icons.book},
      {'label': 'COST', 'icon': Icons.attach_money},
      {'label': 'RATING', 'icon': Icons.star_border},
      {'label': 'LOCATION', 'icon': Icons.location_on_outlined},
    ];

    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: filters.map((filter) {
        return FilterChip(
          label: Text(filter['label']),
          avatar: Icon(filter['icon'], size: 18),
          onSelected: (bool selected) {
            // Handle filter selection
          },
          selected: false,
          backgroundColor: Colors.white,
          selectedColor: Colors.indigo.shade50,
          checkmarkColor: Colors.indigo.shade700,
          labelStyle: TextStyle(
            color: Colors.indigo.shade700,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.indigo.shade300),
          ),
        );
      }).toList(),
    );
  }
}
