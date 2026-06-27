import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String _action = 'Tap the box';
  Color _boxColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_action, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => _update('Tapped!', Colors.green),
          onDoubleTap: () => _update('Double tapped!', Colors.orange),
          onLongPress: () => _update('Long pressed!', Colors.red),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              color: _boxColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _boxColor, width: 2),
            ),
            child: Center(
              child: Text(
                _action.split('!').first,
                style: TextStyle(
                  color: _boxColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Try: tap, double-tap, long-press',
            style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  void _update(String action, Color color) {
    setState(() {
      _action = action;
      _boxColor = color;
    });
  }
}

const gestureDetectorCode = '''GestureDetector(
  onTap: () { /* handle tap */ },
  onDoubleTap: () { /* handle double tap */ },
  onLongPress: () { /* handle long press */ },
  child: Container(
    width: 180, height: 100,
    decoration: BoxDecoration(
      color: Colors.deepPurple.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(16),
    ),
  ),
)''';
