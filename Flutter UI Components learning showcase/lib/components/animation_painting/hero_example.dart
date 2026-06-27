import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Tap the avatar for Hero animation:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const _DetailPage(),
                ),
              );
            },
            child: Hero(
              tag: 'profile-avatar',
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text('Tap me', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _DetailPage extends StatelessWidget {
  const _DetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Detail')),
      body: Center(
        child: Hero(
          tag: 'profile-avatar',
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.deepPurple.shade100,
            child: const Icon(
              Icons.person,
              size: 100,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}

const heroCode = '''// Hero: shared element transition between routes
// Source screen:
GestureDetector(
  onTap: () => Navigator.push(context, MaterialPageRoute(
    builder: (_) => DetailPage(),
  )),
  child: Hero(
    tag: 'profile-avatar',
    child: CircleAvatar(radius: 50, child: Icon(Icons.person)),
  ),
)

// Destination screen:
Scaffold(
  body: Center(
    child: Hero(
      tag: 'profile-avatar',  // MUST match source tag
      child: CircleAvatar(radius: 100, child: Icon(Icons.person)),
    ),
  ),
)''';
