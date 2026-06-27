// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;
    final isSmallScreen = mq.size.width < 360;
    final padding = mq.padding;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MediaQuery Info:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _row('Screen size', '${mq.size.width.toStringAsFixed(0)} x ${mq.size.height.toStringAsFixed(0)}'),
                  _row('Orientation', isLandscape ? 'Landscape' : 'Portrait'),
                  _row('Platform',
                      Theme.of(context).platform.name),
                  _row('Small screen?', isSmallScreen ? 'Yes' : 'No'),
                  _row('Status bar', '${padding.top}px'),
                  _row('Bottom inset', '${padding.bottom}px'),
                  _row('Text scale', mq.textScaleFactor.toStringAsFixed(2)),
                  _row('Pixel density', '${mq.devicePixelRatio}x'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tip: Use MediaQuery.of(context) to build responsive layouts\n'
            'that adapt to different screen sizes and orientations.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          Text(value,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

const mediaQueryCode = '''// MediaQuery: access device/screen information
final mq = MediaQuery.of(context);

// Common properties:
mq.size                // Screen size (width, height)
mq.orientation         // Portrait / Landscape
mq.padding             // Safe area insets (status bar, notch)
mq.textScaleFactor     // User's font size setting
mq.devicePixelRatio    // Pixel density
mq.platform            // Target platform

// Responsive usage:
if (mq.size.width < 600) {
  // Mobile layout
} else {
  // Tablet/desktop layout
}''';
