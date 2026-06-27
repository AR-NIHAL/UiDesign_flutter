import 'package:flutter/material.dart';

class CircleAvatarExample extends StatelessWidget {
  const CircleAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('CircleAvatar:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            const Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                  child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 4),
                Text('Initials', style: TextStyle(fontSize: 11)),
              ],
            ),
            const Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
                ),
                SizedBox(height: 4),
                Text('Network', style: TextStyle(fontSize: 11)),
              ],
            ),
            const Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(height: 4),
                Text('Icon', style: TextStyle(fontSize: 11)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange.withValues(alpha: 0.2),
                  foregroundColor: Colors.orange.shade800,
                  child: const Text('AB', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 4),
                const Text('Custom', style: TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

const circleAvatarCode = '''// Initials-based avatar
CircleAvatar(
  radius: 30,
  backgroundColor: Colors.deepPurple,
  child: Text('JD', style: TextStyle(color: Colors.white)),
)

// Network image avatar
CircleAvatar(
  radius: 30,
  backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
)

// Icon-based avatar
CircleAvatar(
  radius: 30,
  backgroundColor: Colors.teal,
  child: Icon(Icons.person, color: Colors.white),
)''';
