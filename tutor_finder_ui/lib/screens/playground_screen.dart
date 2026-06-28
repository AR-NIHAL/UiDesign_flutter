import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/code_snippets.dart';
import '../common/show_code_overlay.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  bool _useGlass = false;
  double _blur = 12;
  double _distance = 4;
  double _opacity = 0.15;
  double _radius = 20;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Playground')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Tweak parameters below and see the preview update instantly.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 8),
          ShowCodeOverlay(code: CodeSnippets.playground, label: 'How to use'),
          const SizedBox(height: 20),

          // Style toggle
          Row(
            children: [
              Text('Style: ',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: 8),
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: false, label: Text('Neumorphism')),
                  ButtonSegment(value: true, label: Text('Glassmorphism')),
                ],
                selected: {_useGlass},
                onSelectionChanged: (v) =>
                    setState(() => _useGlass = v.first),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Preview
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius),
              gradient: _useGlass
                  ? const LinearGradient(
                      colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                    )
                  : null,
              color: _useGlass ? null : bgColor,
              boxShadow: _useGlass
                  ? null
                  : AppTheme.neoShadows(
                      bgColor: bgColor,
                      blur: _blur,
                      distance: _distance.roundToDouble(),
                    ),
            ),
            child: _useGlass
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(_radius),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: _blur,
                        sigmaY: _blur,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: _opacity),
                          borderRadius: BorderRadius.circular(_radius),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Glass Preview',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      'Neumorphic Preview',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 28),

          // Sliders
          _slider('Blur Radius', _blur, 0, 30, (v) => _blur = v),
          _slider('Shadow Distance', _distance, 0, 16, (v) => _distance = v),
          _slider('Opacity / Strength', _opacity, 0, 0.5, (v) => _opacity = v),
          _slider('Corner Radius', _radius, 0, 40, (v) => _radius = v),

          const SizedBox(height: 20),
          Text(
            _useGlass
                ? 'Glassmorphism uses BackdropFilter + ImageFilter.blur(). '
                    'Higher blur = more frosted look. Higher opacity = more '
                    'visible glass surface.'
                : 'Neumorphism uses two BoxShadows (light + dark). Blur '
                    'controls softness, distance controls how far the element '
                    'floats above the surface.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[500],
                  height: 1.5,
                ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _slider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14)),
              Text(value.toStringAsFixed(1),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            onChanged: (v) => setState(() => onChanged(v)),
          ),
        ],
      ),
    );
  }
}
