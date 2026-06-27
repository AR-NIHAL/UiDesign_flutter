import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            collapsedHeight: 50,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text('SliverToBoxAdapter - Mix of widgets')),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, i) => Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[i % Colors.primaries.length].shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('${i + 1}')),
              ),
              childCount: 9,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text('SliverList item ${i + 1}'),
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}

const customScrollViewCode = '''// CustomScrollView: combines multiple scroll effects (Slivers)
CustomScrollView(
  slivers: [
    // Pinned app bar that collapses on scroll
    SliverAppBar(
      pinned: true,
      expandedHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Title'),
      ),
    ),
    // Regular widget in a sliver
    SliverToBoxAdapter(
      child: Container(height: 80, color: Colors.deepPurple.shade50),
    ),
    // Grid as a sliver
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      delegate: SliverChildBuilderDelegate((_, i) => Container(/* ... */), childCount: 9),
    ),
    // List as a sliver
    SliverList(
      delegate: SliverChildBuilderDelegate((_, i) => ListTile(/* ... */), childCount: 5),
    ),
  ],
)''';
