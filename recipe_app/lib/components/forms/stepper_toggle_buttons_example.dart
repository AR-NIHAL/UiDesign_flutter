import 'package:flutter/material.dart';

class StepperToggleButtonsExample extends StatefulWidget {
  const StepperToggleButtonsExample({super.key});

  @override
  State<StepperToggleButtonsExample> createState() => _StepperToggleButtonsExampleState();
}

class _StepperToggleButtonsExampleState extends State<StepperToggleButtonsExample> {
  int _currentStep = 0;
  final _selectedOptions = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('ToggleButtons:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ToggleButtons(
          isSelected: _selectedOptions,
          onPressed: (i) => setState(() => _selectedOptions[i] = !_selectedOptions[i]),
          borderRadius: BorderRadius.circular(8),
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Bold'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Italic'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Underline'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Stepper:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() => _currentStep++);
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep--);
              }
            },
            steps: const [
              Step(
                title: Text('Step 1'),
                subtitle: Text('Personal info'),
                content: Text('Enter your name and email'),
              ),
              Step(
                title: Text('Step 2'),
                subtitle: Text('Preferences'),
                content: Text('Set your preferences'),
              ),
              Step(
                title: Text('Step 3'),
                subtitle: Text('Review'),
                content: Text('Review and confirm'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const stepperToggleButtonsCode = '''// ToggleButtons: multi-select toggle group
ToggleButtons(
  isSelected: [true, false, false],
  onPressed: (index) => setState(() => _selected[index] = !_selected[index]),
  borderRadius: BorderRadius.circular(8),
  children: [
    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Bold')),
    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Italic')),
    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Underline')),
  ],
)

// Stepper: step-by-step wizard
Stepper(
  currentStep: _currentStep,
  onStepContinue: () => setState(() => _currentStep++),
  onStepCancel: () => setState(() => _currentStep--),
  steps: [
    Step(title: Text('Step 1'), content: Text('Content')),
    Step(title: Text('Step 2'), content: Text('Content')),
  ],
)''';
