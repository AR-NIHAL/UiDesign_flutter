import 'package:flutter/material.dart';

class TutorDirScreen extends StatefulWidget {
  const TutorDirScreen({super.key});

  @override
  State<TutorDirScreen> createState() => _TutorDirScreenState();
}

class _TutorDirScreenState extends State<TutorDirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

//Sliver AppBar
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
        icon: Icon(Icons.menu),
      ),
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: Colors.pinkAccent),
        title: Text(
          "Tutor Finder",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//App Drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [DrawerHeader(child: Text("Ashikur Rahman"))],
      ),
    );
  }
}
