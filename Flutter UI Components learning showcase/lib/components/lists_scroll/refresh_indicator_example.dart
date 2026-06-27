import 'package:flutter/material.dart';

class RefreshIndicatorExample extends StatefulWidget {
  const RefreshIndicatorExample({super.key});

  @override
  State<RefreshIndicatorExample> createState() => _RefreshIndicatorExampleState();
}

class _RefreshIndicatorExampleState extends State<RefreshIndicatorExample> {
  int _itemCount = 5;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _itemCount = _itemCount + 1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: List.generate(
            _itemCount,
            (i) => ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('Item ${i + 1}'),
              subtitle: const Text('Pull down to refresh'),
            ),
          ),
        ),
      ),
    );
  }
}

const refreshIndicatorCode = '''// RefreshIndicator: pull-to-refresh gesture
RefreshIndicator(
  onRefresh: () async {
    // Fetch new data
    await Future.delayed(Duration(seconds: 1));
    setState(() { /* update state */ });
  },
  child: ListView(children: [/* list items */]),
)

// The child MUST be a scrollable widget (ListView, GridView, etc.)
// Wrap with SizedBox if needed to give it a height''';
