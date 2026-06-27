import 'package:flutter/material.dart';

class ResponsiveLayoutExample extends StatelessWidget {
  const ResponsiveLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth > 600) {
          return _WideLayout();
        }
        return _NarrowLayout();
      },
    );
  }
}

class _NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _section('Mobile Layout', Icons.phone_android),
        const SizedBox(height: 8),
        for (int i = 0; i < 3; i++)
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[i].shade100,
                child: Icon(Icons.article, color: Colors.primaries[i]),
              ),
              title: Text('Item ${i + 1}'),
              subtitle: Text('Description for item ${i + 1}'),
            ),
          ),
      ],
    );
  }

  Widget _section(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.tablet_mac, color: Colors.deepPurple),
            const SizedBox(width: 8),
            const Text('Tablet/Desktop Layout',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            3,
            (i) => Expanded(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.article,
                          size: 40, color: Colors.primaries[i]),
                      const SizedBox(height: 8),
                      Text('Card ${i + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Description',
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const responsiveLayoutCode = '''// Responsive layout: adapt UI to screen width
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return WideLayout();  // Tablet/Desktop
    } else {
      return NarrowLayout();  // Phone
    }
  },
)

// Recommended breakpoints:
// < 600: Phone (narrow, stacked)
// 600-900: Tablet (medium, side-by-side)
// > 900: Desktop (wide, multi-column)

// Also combine with:
// MediaQuery.of(context).orientation
// MediaQuery.of(context).size.width''';
