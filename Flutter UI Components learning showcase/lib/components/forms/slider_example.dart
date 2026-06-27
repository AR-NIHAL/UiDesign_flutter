import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value = 50;
  RangeValues _range = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Slider:', style: TextStyle(fontWeight: FontWeight.w600)),
          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 10,
            label: _value.round().toString(),
            onChanged: (v) => setState(() => _value = v),
          ),
          Text('Value: ${_value.round()}'),
          const SizedBox(height: 16),
          const Text('RangeSlider:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          RangeSlider(
            values: _range,
            min: 0,
            max: 100,
            divisions: 10,
            labels: RangeLabels(
              _range.start.round().toString(),
              _range.end.round().toString(),
            ),
            onChanged: (v) => setState(() => _range = v),
          ),
          Text('Range: ${_range.start.round()} - ${_range.end.round()}'),
        ],
      ),
    );
  }
}

const sliderCode = '''// Slider: single value selection
Slider(
  value: _value,
  min: 0,
  max: 100,
  divisions: 10,        // snap to discrete steps
  label: _value.round().toString(),
  onChanged: (v) => setState(() => _value = v),
)

// RangeSlider: select a range of values
RangeSlider(
  values: _range,
  min: 0,
  max: 100,
  divisions: 10,
  labels: RangeLabels(
    _range.start.round().toString(),
    _range.end.round().toString(),
  ),
  onChanged: (v) => setState(() => _range = v),
)''';
