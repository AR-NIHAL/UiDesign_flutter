import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepPurple, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Container',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}

const containerCode = '''Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.deepPurple.shade50,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.deepPurple, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.deepPurple.withValues(alpha: 0.3),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Center(child: Text('Container')),
)''';
