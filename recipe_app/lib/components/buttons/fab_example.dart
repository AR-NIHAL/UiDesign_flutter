import 'package:flutter/material.dart';

class FABExample extends StatelessWidget {
  const FABExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('FloatingActionButton:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            alignment: WrapAlignment.center,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: _dummy,
                    child: Icon(Icons.add),
                  ),
                  SizedBox(height: 6),
                  Text('Regular', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton.small(
                    onPressed: _dummy,
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(height: 6),
                  Text('Small', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton.large(
                    onPressed: _dummy,
                    child: Icon(Icons.add),
                  ),
                  SizedBox(height: 6),
                  Text('Large', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton.extended(
                    onPressed: _dummy,
                    icon: Icon(Icons.add),
                    label: Text('Create'),
                  ),
                  SizedBox(height: 6),
                  Text('Extended', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _dummy() {}

const fabCode = '''// Regular FAB
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)

// Small, large, and extended variants
FloatingActionButton.small(onPressed: () {}, child: Icon(Icons.edit))
FloatingActionButton.large(onPressed: () {}, child: Icon(Icons.add))
FloatingActionButton.extended(
  onPressed: () {},
  icon: Icon(Icons.add),
  label: Text('Create'),
)''';
