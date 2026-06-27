import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/app.dart';

void main() {
  testWidgets('App renders home screen', (tester) async {
    await tester.pumpWidget(const FlutterUIComponentsApp());
    expect(find.text('Flutter UI Components'), findsOneWidget);
  });
}
