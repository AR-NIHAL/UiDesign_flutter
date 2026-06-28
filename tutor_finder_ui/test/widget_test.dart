import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:modern_ui_showcase/main.dart';
import 'package:modern_ui_showcase/screens/neumorphism_screen.dart';
import 'package:modern_ui_showcase/screens/glassmorphism_screen.dart';
import 'package:modern_ui_showcase/screens/playground_screen.dart';
import 'package:modern_ui_showcase/screens/about_screen.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_button.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_card.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_toggle.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_icon.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_slider.dart';
import 'package:modern_ui_showcase/widgets/neumorphic/neumorphic_input.dart';
import 'package:modern_ui_showcase/widgets/glassmorphic/glassmorphic_card.dart';
import 'package:modern_ui_showcase/widgets/glassmorphic/glassmorphic_button.dart';
import 'package:modern_ui_showcase/widgets/glassmorphic/glassmorphic_avatar.dart';
import 'package:modern_ui_showcase/common/show_code_overlay.dart';

Widget boilerplate(Widget child) {
  return MaterialApp(
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    home: Scaffold(body: child),
  );
}

/// Scrolls down the nearest [Scrollable] until [text] is found.
Future<void> scrollTo(WidgetTester tester, String text) async {
  await tester.scrollUntilVisible(
    find.text(text),
    200,
    scrollable: find.byType(Scrollable).last,
  );
}

void main() {
  group('HomeScreen', () {
    testWidgets('renders all three style cards', (tester) async {
      await tester.pumpWidget(const ModernUIApp());
      expect(find.text('Modern UI Showcase'), findsOneWidget);
      expect(find.text('Neumorphism'), findsOneWidget);
      expect(find.text('Glassmorphism'), findsOneWidget);
      expect(find.text('Interactive Playground'), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('navigates to About screen', (tester) async {
      await tester.pumpWidget(const ModernUIApp());
      await tester.tap(find.byIcon(Icons.info_outline));
      await tester.pumpAndSettle();
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Modern UI Showcase'), findsWidgets);
    });
  });

  group('NeumorphismScreen', () {
    testWidgets('renders all section headers and widgets', (tester) async {
      await tester.pumpWidget(boilerplate(const NeumorphismScreen()));
      await tester.pump();

      expect(find.text('Neumorphic Button'), findsOneWidget);
      expect(find.text('Neumorphic Card'), findsOneWidget);

      await scrollTo(tester, 'Neumorphic Toggle');
      expect(find.text('Neumorphic Toggle'), findsOneWidget);

      await scrollTo(tester, 'Neumorphic Slider');
      expect(find.text('Neumorphic Slider'), findsOneWidget);

      await scrollTo(tester, 'Neumorphic Input');
      expect(find.text('Neumorphic Input'), findsOneWidget);
    });

    testWidgets('toggle can be interacted with', (tester) async {
      await tester.pumpWidget(boilerplate(const NeumorphismScreen()));
      await tester.pump();
      await scrollTo(tester, 'Neumorphic Toggle');
      await tester.tap(find.byType(NeumorphicToggle));
      await tester.pump();
    });
  });

  group('GlassmorphismScreen', () {
    testWidgets('renders all section headers', (tester) async {
      await tester.pumpWidget(boilerplate(const GlassmorphismScreen()));
      await tester.pump();

      expect(find.text('Glassmorphic Card'), findsOneWidget);

      await scrollTo(tester, 'Glassmorphic Nav Bar');
      expect(find.text('Glassmorphic Nav Bar'), findsOneWidget);

      await scrollTo(tester, 'Glassmorphic Button');
      expect(find.text('Glassmorphic Button'), findsOneWidget);

      await scrollTo(tester, 'Glassmorphic Dialog');
      expect(find.text('Glassmorphic Dialog'), findsOneWidget);
    });
  });

  group('PlaygroundScreen', () {
    testWidgets('renders and allows slider interaction', (tester) async {
      await tester.pumpWidget(boilerplate(const PlaygroundScreen()));
      await tester.pump();

      expect(find.text('Interactive Playground'), findsOneWidget);
      expect(find.text('Style: '), findsOneWidget);
      expect(find.text('Blur Radius'), findsOneWidget);
      expect(find.text('Shadow Distance'), findsOneWidget);

      await scrollTo(tester, 'Opacity / Strength');
      expect(find.text('Opacity / Strength'), findsOneWidget);

      await scrollTo(tester, 'Corner Radius');
      expect(find.text('Corner Radius'), findsOneWidget);
    });

    testWidgets('switching style toggles the preview', (tester) async {
      await tester.pumpWidget(boilerplate(const PlaygroundScreen()));
      await tester.pump();

      expect(find.text('Neumorphic Preview'), findsOneWidget);

      await tester.tap(find.text('Glassmorphism').last);
      await tester.pumpAndSettle();

      expect(find.text('Glass Preview'), findsOneWidget);
    });
  });

  group('AboutScreen', () {
    testWidgets('renders all sections', (tester) async {
      await tester.pumpWidget(boilerplate(const AboutScreen()));
      await tester.pump();

      expect(find.text('About'), findsOneWidget);
      expect(find.text('What is this?'), findsOneWidget);

      await scrollTo(tester, 'Tech Stack');
      expect(find.text('Tech Stack'), findsOneWidget);

      await scrollTo(tester, 'How to learn from this app');
      expect(find.text('How to learn from this app'), findsOneWidget);
    });
  });

  group('Neumorphic widgets', () {
    testWidgets('NeumorphicButton renders', (tester) async {
      await tester.pumpWidget(boilerplate(const NeumorphicButton()));
      expect(find.text('Press Me'), findsOneWidget);
    });

    testWidgets('NeumorphicCard renders child', (tester) async {
      await tester.pumpWidget(boilerplate(
        const NeumorphicCard(child: Text('Card content')),
      ));
      expect(find.text('Card content'), findsOneWidget);
    });

    testWidgets('NeumorphicIcon renders', (tester) async {
      await tester.pumpWidget(boilerplate(
        const NeumorphicIcon(icon: Icons.home),
      ));
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('NeumorphicSlider renders', (tester) async {
      await tester.pumpWidget(boilerplate(
        NeumorphicSlider(value: 50, onChanged: (_) {}),
      ));
      expect(find.byType(Slider), findsOneWidget);
    });

    testWidgets('NeumorphicInput renders', (tester) async {
      await tester.pumpWidget(boilerplate(
        const NeumorphicInput(hintText: 'Test hint'),
      ));
      expect(find.text('Test hint'), findsOneWidget);
    });
  });

  group('Glassmorphic widgets', () {
    testWidgets('GlassmorphicCard renders child', (tester) async {
      await tester.pumpWidget(boilerplate(
        const GlassmorphicCard(child: Text('Glass content')),
      ));
      expect(find.text('Glass content'), findsOneWidget);
    });

    testWidgets('GlassmorphicButton renders', (tester) async {
      await tester.pumpWidget(boilerplate(
        const GlassmorphicButton(label: 'Tap me'),
      ));
      expect(find.text('Tap me'), findsOneWidget);
    });

    testWidgets('GlassmorphicAvatar renders initials', (tester) async {
      await tester.pumpWidget(boilerplate(
        const GlassmorphicAvatar(initials: 'JD', size: 50),
      ));
      expect(find.text('JD'), findsOneWidget);
    });
  });

  group('ShowCodeOverlay', () {
    testWidgets('shows and hides code on tap', (tester) async {
      await tester.pumpWidget(boilerplate(
        const ShowCodeOverlay(code: 'test code snippet'),
      ));

      expect(find.text('test code snippet'), findsNothing);

      await tester.tap(find.text('Show Code'));
      await tester.pump();
      expect(find.text('test code snippet'), findsOneWidget);

      await tester.tap(find.text('Hide Code'));
      await tester.pump();
      expect(find.text('test code snippet'), findsNothing);
    });
  });
}
