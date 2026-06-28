import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NeumorphicSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const NeumorphicSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.neoShadows(
          bgColor: bgColor,
          blur: 8,
          distance: 3,
        ),
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveTrackColor: bgColor,
          thumbColor: bgColor,
          overlayColor: Colors.transparent,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
          trackHeight: 6,
        ),
        child: Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
