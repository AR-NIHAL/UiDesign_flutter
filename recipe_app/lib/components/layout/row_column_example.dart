import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  const RowColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Row (horizontal):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _box(Colors.red),
            _box(Colors.green),
            _box(Colors.blue),
          ],
        ),
        const SizedBox(height: 24),
        const Text('Column (vertical):',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _box(Colors.orange),
                _box(Colors.purple),
                _box(Colors.teal),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _box(Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

const rowColumnCode = '''// Row places children horizontally
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(width: 60, height: 60, color: Colors.red),
    Container(width: 60, height: 60, color: Colors.green),
    Container(width: 60, height: 60, color: Colors.blue),
  ],
)

// Column places children vertically
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(width: 60, height: 60, color: Colors.orange),
    Container(width: 60, height: 60, color: Colors.purple),
    Container(width: 60, height: 60, color: Colors.teal),
  ],
)''';
