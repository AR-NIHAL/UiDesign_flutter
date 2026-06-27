import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({super.key});

  @override
  State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('AnimatedBuilder (rotation):',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: _animation,
            builder: (_, child) => Transform.rotate(
              angle: _animation.value,
              child: child,
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: const Center(
                child: Text(
                  'Spin',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: Text(_controller.isCompleted ? 'Reverse' : 'Start'),
          ),
          const SizedBox(height: 16),
          const Text('TweenAnimationBuilder (auto):',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(seconds: 1),
            builder: (_, value, __) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Fade & Slide In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            onEnd: () {},
          ),
        ],
      ),
    );
  }
}

const tweenAnimationCode = '''// AnimatedBuilder: custom animations with controller
AnimationController(
  vsync: this,
  duration: Duration(seconds: 2),
);
final animation = Tween<double>(begin: 0, end: 2*pi).animate(
  CurvedAnimation(parent: controller, curve: Curves.easeInOut),
);

AnimatedBuilder(
  animation: animation,
  builder: (_, child) => Transform.rotate(
    angle: animation.value,
    child: child,
  ),
  child: Container(/* ... */),
)

// TweenAnimationBuilder: auto-animate without controller
TweenAnimationBuilder<double>(
  tween: Tween(begin: 0, end: 1),
  duration: Duration(seconds: 1),
  builder: (_, value, __) => Opacity(
    opacity: value,
    child: Transform.translate(
      offset: Offset(0, 30 * (1 - value)),
      child: Text('Fade & Slide In'),
    ),
  ),
)''';
