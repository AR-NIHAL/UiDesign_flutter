import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomPainterClipExample extends StatelessWidget {
  const CustomPainterClipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('CustomPainter:',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            CustomPaint(
              size: const Size(200, 100),
              painter: _WavePainter(),
            ),
            const SizedBox(height: 16),
            const Text('ClipRRect (rounded corners):',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 150,
                height: 100,
                color: Colors.deepPurple.shade200,
                child: const Center(child: Text('Rounded', style: TextStyle(color: Colors.white))),
              ),
            ),
            const SizedBox(height: 16),
            const Text('ClipPath (custom shape):',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ClipPath(
              clipper: _TriangleClipper(),
              child: Container(
                width: 150,
                height: 100,
                color: Colors.teal,
                child: const Center(child: Text('Triangle', style: TextStyle(color: Colors.white))),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Transform:',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.rotate(
                  angle: 0.2,
                  child: _transformBox('Rotate', Colors.orange),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: _transformBox('Scale', Colors.purple),
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: _transformBox('Move', Colors.indigo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _transformBox(String label, Color color) {
    return Container(
      width: 60,
      height: 60,
      color: color.withValues(alpha: 0.5),
      child: Center(child: Text(label, style: const TextStyle(fontSize: 10))),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.6);

    for (double x = 0; x <= size.width; x++) {
      path.lineTo(
        x,
        size.height * 0.6 + math.sin((x / size.width) * 2 * 3.14159) * 20,
      );
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);

    // Draw border line
    final borderPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

const customPainterCode = '''// CustomPainter: draw anything with a canvas
CustomPaint(
  size: Size(200, 100),
  painter: _MyPainter(),
)

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(50, 50), 40, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

// ClipRRect: clip to rounded rectangle
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(width: 150, height: 100, color: Colors.deepPurple),
)

// ClipPath: clip to custom shape
ClipPath(
  clipper: _TriangleClipper(),
  child: Container(width: 150, height: 100, color: Colors.teal),
)

// Transform: rotate, scale, translate
Transform.rotate(angle: 0.2, child: /* widget */)
Transform.scale(scale: 1.2, child: /* widget */)
Transform.translate(offset: Offset(0, -10), child: /* widget */)''';
