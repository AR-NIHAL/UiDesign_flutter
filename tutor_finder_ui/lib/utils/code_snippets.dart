class CodeSnippets {
  CodeSnippets._();

  static const String neumorphicButton = '''
NeumorphicButton uses dual BoxShadows — light (top-left)
and dark (bottom-right) — to extrude from the surface.
On press, shadows flip inward (BlurStyle.inner) for a
concave "pressed" look.

```dart
BoxShadow(
  color: lightShadow,
  offset: const Offset(-4, -4),
  blurRadius: 12,
  blurStyle: BlurStyle.normal,  // convex
)
BoxShadow(
  color: darkShadow,
  offset: const Offset(4, 4),
  blurRadius: 12,
)
```''';

  static const String neumorphicCard = '''
A static extruded container — pure BoxShadow decoration.

```dart
Container(
  decoration: BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(offset: Offset(-4, -4), blurRadius: 12, color: white),
      BoxShadow(offset: Offset(4, 4), blurRadius: 12, color: darkGrey),
    ],
  ),
  child: child,
)
```''';

  static const String neumorphicToggle = '''
The toggle switches its background shadows from normal
(extruded, off) to inner (inset, on). The thumb knob
also loses its shadow when "pressed in".

```dart
AnimatedContainer(
  decoration: BoxDecoration(
    boxShadow: value
        ? AppTheme.neoShadows(inset: true)  // concave
        : AppTheme.neoShadows(),            // convex
  ),
)
```''';

  static const String neumorphicIcon = '''
Circular container with neumorphic shadows.

```dart
Container(
  shape: BoxShape.circle,
  decoration: BoxDecoration(
    boxShadow: AppTheme.neoShadows(),
  ),
  child: Icon(icon),
)
```''';

  static const String neumorphicSlider = '''
A neumorphic slider track with an extruded thumb.
The track uses inset shadows to appear recessed,
while the thumb stays extruded.

```dart
SliderTheme(
  data: SliderThemeData(
    trackShape: _NeumorphicTrack(),
    thumbShape: _NeumorphicThumb(),
  ),
  child: Slider(...),
)
```''';

  static const String neumorphicInput = '''
A neumorphic text field with an inset (concave)
appearance, mimicking a recessed input area.

```dart
Container(
  decoration: BoxDecoration(
    boxShadow: AppTheme.neoShadows(inset: true),
  ),
  child: TextField(
    decoration: InputDecoration(border: InputBorder.none),
  ),
)
```''';

  static const String glassmorphicCard = '''
Glassmorphism uses BackdropFilter + ImageFilter.blur()
with a semi-transparent background color.

```dart
ClipRRect(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
    child: Container(
      color: Colors.white.withValues(alpha: 0.15),
      border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
    ),
  ),
)
```''';

  static const String glassmorphicNavbar = '''
A frosted-glass bottom nav bar using the same
BackdropFilter pattern applied to a row.

```dart
ClipRRect(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
    child: Container(
      color: Colors.white.withValues(alpha: 0.12),
      border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      child: Row(children: [...navItems]),
    ),
  ),
)
```''';

  static const String glassmorphicAvatar = '''
A circular avatar with a glass overlay on top of
a gradient circle. The overlay blurs the base.

```dart
Stack(
  children: [
    Container(decoration: gradient circle),
    ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(color: Colors.white.withValues(alpha: 0.1)),
      ),
    ),
  ],
)
```''';

  static const String glassmorphicButton = '''
A frosted-glass button with press feedback.

```dart
ClipRRect(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
    child: Container(
      color: Colors.white.withValues(alpha: 0.15),
      child: Text(label),
    ),
  ),
)
```''';

  static const String glassmorphicDialog = '''
A glassmorphic dialog overlay. The BackdropFilter
blurs the content behind the dialog.

```dart
BackdropFilter(
  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
  child: AlertDialog(
    backgroundColor: Colors.white.withValues(alpha: 0.2),
  ),
)
```''';

  static const String playground = '''
The Playground lets you tweak the key parameters
of each style in real time:

• Blur radius — softness of the shadow/frost
• Shadow distance — how far the element appears to float
• Opacity — transparency of glass / strength of shadow
• Corner radius — roundness of the widget

Change any slider and watch the preview update instantly.
''';
}
