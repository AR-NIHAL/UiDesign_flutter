import 'package:flutter/material.dart';

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a basic snack bar'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Show basic SnackBar'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item deleted'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            child: const Text('SnackBar with action'),
          ),
        ],
      ),
    );
  }
}

const snackBarCode = '''// Basic SnackBar
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('This is a snack bar'),
    duration: Duration(seconds: 2),
  ),
)

// SnackBar with action button
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Item deleted'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () { /* undo action */ },
    ),
    behavior: SnackBarBehavior.floating,
  ),
)''';
