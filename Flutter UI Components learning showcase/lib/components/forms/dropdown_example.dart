// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _selectedCountry;
  final _countries = ['USA', 'Canada', 'UK', 'Germany', 'India', 'Australia'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('DropdownButtonFormField:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedCountry,
            decoration: InputDecoration(
              labelText: 'Country',
              prefixIcon: const Icon(Icons.public),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: _countries
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (v) => setState(() => _selectedCountry = v),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedCountry != null
                ? 'Selected: $_selectedCountry'
                : 'Select a country',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

const dropdownCode = '''// DropdownButtonFormField: selection dropdown
DropdownButtonFormField<String>(
  value: _selectedCountry,
  decoration: InputDecoration(
    labelText: 'Country',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
  items: countries
      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
      .toList(),
  onChanged: (value) => setState(() => _selectedCountry = value),
)

// Also available: DropdownButton (simpler, no form integration)''';
