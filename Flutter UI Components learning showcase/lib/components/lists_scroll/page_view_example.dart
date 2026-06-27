import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180,
          child: PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => _currentPage = i),
            children: [
              _page('Page 1', Colors.deepPurple),
              _page('Page 2', Colors.teal),
              _page('Page 3', Colors.orange),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (i) => Container(
              width: _currentPage == i ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: _currentPage == i
                    ? Colors.deepPurple
                    : Colors.deepPurple.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _page(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}

const pageViewCode = '''// PageView: swipeable pages
PageView(
  controller: _controller,
  onPageChanged: (index) { /* track page */ },
  children: [
    Container(color: Colors.deepPurple.shade50, child: Center(child: Text('Page 1'))),
    Container(color: Colors.teal.shade50, child: Center(child: Text('Page 2'))),
    Container(color: Colors.orange.shade50, child: Center(child: Text('Page 3'))),
  ],
)

// Page indicators (dots):
Row(
  children: List.generate(3, (i) => Container(
    width: currentPage == i ? 24 : 8, height: 8,
    decoration: BoxDecoration(
      color: currentPage == i ? Colors.deepPurple : Colors.deepPurple.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(4),
    ),
  )),
)''';
