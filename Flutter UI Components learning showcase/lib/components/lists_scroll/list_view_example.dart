import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: List.generate(
          15,
          (i) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.primaries[i % Colors.primaries.length],
                child: Text('${i + 1}'),
              ),
              title: Text('Item ${i + 1}'),
              subtitle: Text('This is description for item ${i + 1}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ),
      ),
    );
  }
}

const listViewCode = '''// ListView: scrollable list of items
ListView(
  padding: EdgeInsets.symmetric(horizontal: 16),
  children: [
    Card(child: ListTile(/* ... */)),
    Card(child: ListTile(/* ... */)),
    // ... more items
  ],
)

// For large lists, use ListView.builder (lazy loading):
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => ListTile(
    title: Text('Item \$index'),
  ),
)''';
