import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        children: List.generate(
          9,
          (i) => Card(
            color: Colors.primaries[i % Colors.primaries.length].shade100,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.grid_view_rounded,
                    color: Colors.primaries[i % Colors.primaries.length],
                    size: 32,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${i + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.primaries[i % Colors.primaries.length],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const gridViewCode = '''// GridView with fixed cross axis count (e.g., 3 columns)
GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 0.9,
  ),
  children: [/* grid items */],
)

// Alternative: SliverGridDelegateWithMaxCrossAxisExtent
// (auto-fits as many columns as possible with min item width)
GridView(
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 120,
  ),
  children: [/* items */],
)''';
