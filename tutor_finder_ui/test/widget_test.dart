import 'package:flutter_test/flutter_test.dart';

import 'package:modern_ui_showcase/main.dart';

void main() {
  testWidgets('App renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ModernUIApp());

    expect(find.text('Modern UI Showcase'), findsOneWidget);
    expect(find.text('Neumorphism'), findsOneWidget);
    expect(find.text('Glassmorphism'), findsOneWidget);
  });
}
