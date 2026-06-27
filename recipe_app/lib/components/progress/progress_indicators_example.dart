import 'package:flutter/material.dart';

class ProgressIndicatorsExample extends StatefulWidget {
  const ProgressIndicatorsExample({super.key});

  @override
  State<ProgressIndicatorsExample> createState() => _ProgressIndicatorsExampleState();
}

class _ProgressIndicatorsExampleState extends State<ProgressIndicatorsExample> {
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('CircularProgressIndicator:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 24),
              CircularProgressIndicator(value: 0.6),
              SizedBox(width: 24),
              CircularProgressIndicator(
                value: 0.6,
                strokeWidth: 8,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('LinearProgressIndicator:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const LinearProgressIndicator(),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: _progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(height: 8),
          Slider(
            value: _progress,
            onChanged: (v) => setState(() => _progress = v),
            min: 0,
            max: 1,
          ),
          Text('${(_progress * 100).round()}%'),
        ],
      ),
    );
  }
}

const progressIndicatorsCode = '''// Circular: indeterminate (spinning) or determinate
CircularProgressIndicator()                    // Spinning
CircularProgressIndicator(value: 0.6)          // 60% complete
CircularProgressIndicator(                     // Custom size
  value: 0.6, strokeWidth: 8,
  backgroundColor: Colors.grey,
)

// Linear: indeterminate or determinate
LinearProgressIndicator()                       // Indeterminate
LinearProgressIndicator(                        // 30% complete
  value: 0.3,
  minHeight: 8,
  borderRadius: BorderRadius.circular(4),
)''';
