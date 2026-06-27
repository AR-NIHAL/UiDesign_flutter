import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade100,
                        child: const Icon(Icons.restaurant, color: Colors.deepPurple),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Flutter Card',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Elevation: 4, BorderRadius: 16',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Icon(Icons.more_vert, color: Colors.grey.shade600),
                    ],
                  ),
                  const Divider(height: 24),
                  const Text(
                    'Cards are Material Design surfaces that group related '
                    'content and actions. They can contain any widgets.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: Colors.deepPurple.shade50,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.deepPurple),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text('Cards with custom color and no elevation'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const cardCode = '''// Standard card with elevation and shape
Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(children: [/* content */]),
  ),
)

// Flat card with custom color
Card(
  color: Colors.deepPurple.shade50,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Row(children: [/* content */]),
  ),
)''';
