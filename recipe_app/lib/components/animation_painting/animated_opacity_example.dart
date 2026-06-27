import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _visible ? 1.0 : 0.0,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'Fade me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => setState(() => _visible = !_visible),
            child: Text(_visible ? 'Hide' : 'Show'),
          ),
        ],
      ),
    );
  }
}

const animatedOpacityCode = '''// AnimatedOpacity: fades a widget in/out smoothly
AnimatedOpacity(
  duration: Duration(milliseconds: 500),
  opacity: _visible ? 1.0 : 0.0,
  child: Container(
    width: 150, height: 150,
    color: Colors.deepPurple,
    child: Center(child: Text('Fade me')),
  ),
)''';
