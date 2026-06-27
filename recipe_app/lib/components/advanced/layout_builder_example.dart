import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('LayoutBuilder:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Resize the parent to see it adapt:',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: LayoutBuilder(
              builder: (_, constraints) {
                final isWide = constraints.maxWidth > 200;

                if (isWide) {
                  return Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(Icons.star, color: Colors.deepPurple, size: 32),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wide layout',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Row with icon + text',
                              style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(Icons.star, color: Colors.deepPurple, size: 24),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('Narrow layout',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const Text('Column stacked',
                          style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text('OrientationBuilder:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: OrientationBuilder(
              builder: (_, orientation) {
                return Card(
                  child: Center(
                    child: Text(
                      'Orientation: ${orientation == Orientation.portrait ? 'Portrait' : 'Landscape'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const layoutBuilderCode = '''// LayoutBuilder: build UI based on parent constraints
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return Row(children: [/* wide layout */]);
    } else {
      return Column(children: [/* narrow layout */]);
    }
  },
)

// OrientationBuilder: respond to device orientation
OrientationBuilder(
  builder: (context, orientation) {
    return Text(orientation == Orientation.portrait ? 'Portrait' : 'Landscape');
  },
)

// Key difference:
// LayoutBuilder = parent size
// OrientationBuilder = device orientation''';
