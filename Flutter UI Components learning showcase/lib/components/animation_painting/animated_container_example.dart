import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _expand = false;
  final _colors = [Colors.deepPurple, Colors.teal, Colors.orange, Colors.pink];
  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: _expand ? 200 : 100,
            height: _expand ? 200 : 100,
            decoration: BoxDecoration(
              color: _colors[_colorIndex].withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(_expand ? 30 : 10),
              border: Border.all(
                color: _colors[_colorIndex],
                width: 3,
              ),
            ),
            child: Center(
              child: Text(
                _expand ? 'Wide' : 'Small',
                style: TextStyle(
                  color: _colors[_colorIndex],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              setState(() {
                _expand = !_expand;
                _colorIndex = (_colorIndex + 1) % _colors.length;
              });
            },
            child: Text(_expand ? 'Shrink' : 'Expand'),
          ),
        ],
      ),
    );
  }
}

const animatedContainerCode = '''// AnimatedContainer: smoothly transitions between styles
AnimatedContainer(
  duration: Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  width: _expand ? 200 : 100,
  height: _expand ? 200 : 100,
  decoration: BoxDecoration(
    color: Colors.deepPurple.withValues(alpha: 0.2),
    borderRadius: BorderRadius.circular(_expand ? 30 : 10),
    border: Border.all(color: Colors.deepPurple, width: 3),
  ),
  child: Center(child: Text(_expand ? 'Wide' : 'Small')),
)

// Animates: size, color, border, border-radius, padding, alignment''';
