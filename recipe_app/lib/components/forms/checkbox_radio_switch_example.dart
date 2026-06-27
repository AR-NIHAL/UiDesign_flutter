// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class CheckboxRadioSwitchExample extends StatefulWidget {
  const CheckboxRadioSwitchExample({super.key});

  @override
  State<CheckboxRadioSwitchExample> createState() => _CheckboxRadioSwitchExampleState();
}

class _CheckboxRadioSwitchExampleState extends State<CheckboxRadioSwitchExample> {
  bool _checked = false;
  bool _switched = false;
  String? _selectedFruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: const Text('Accept terms'),
            subtitle: const Text('I agree to the terms and conditions'),
            value: _checked,
            onChanged: (v) => setState(() => _checked = v ?? false),
            secondary: const Icon(Icons.description),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Dark mode'),
            subtitle: const Text('Enable dark theme'),
            value: _switched,
            onChanged: (v) => setState(() => _switched = v),
            secondary: const Icon(Icons.dark_mode),
          ),
          const Divider(),
          const Text('Favorite fruit:', style: TextStyle(fontWeight: FontWeight.w600)),
          RadioListTile(
            title: const Text('Apple'),
            value: 'apple',
            groupValue: _selectedFruit,
            onChanged: (v) => setState(() => _selectedFruit = v),
          ),
          RadioListTile(
            title: const Text('Banana'),
            value: 'banana',
            groupValue: _selectedFruit,
            onChanged: (v) => setState(() => _selectedFruit = v),
          ),
          RadioListTile(
            title: const Text('Orange'),
            value: 'orange',
            groupValue: _selectedFruit,
            onChanged: (v) => setState(() => _selectedFruit = v),
          ),
        ],
      ),
    );
  }
}

const checkboxRadioSwitchCode = '''// CheckboxListTile: labeled checkbox
CheckboxListTile(
  title: Text('Accept terms'),
  value: _checked,
  onChanged: (value) => setState(() => _checked = value ?? false),
)

// SwitchListTile: labeled switch
SwitchListTile(
  title: Text('Dark mode'),
  value: _switched,
  onChanged: (value) => setState(() => _switched = value),
)

// RadioListTile: labeled radio button (use with groupValue)
RadioListTile(
  title: Text('Apple'),
  value: 'apple',
  groupValue: _selectedFruit,
  onChanged: (value) => setState(() => _selectedFruit = value),
)''';
