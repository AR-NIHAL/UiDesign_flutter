import 'package:recipe_app/models/component_model.dart';
import 'package:recipe_app/data/categories.dart';
import 'package:recipe_app/components/layout/container_example.dart';
import 'package:recipe_app/components/layout/row_column_example.dart';
import 'package:recipe_app/components/layout/stack_example.dart';
import 'package:recipe_app/components/layout/expanded_flexible_example.dart';
import 'package:recipe_app/components/layout/sized_box_padding_example.dart';
import 'package:recipe_app/components/layout/center_align_example.dart';
import 'package:recipe_app/components/layout/wrap_fitted_box_example.dart';
import 'package:recipe_app/components/layout/constrained_box_example.dart';
import 'package:recipe_app/components/text_input/text_example.dart';
import 'package:recipe_app/components/text_input/text_field_example.dart';
import 'package:recipe_app/components/text_input/text_form_field_example.dart';
import 'package:recipe_app/components/text_input/rich_text_example.dart';
import 'package:recipe_app/components/buttons/material_buttons_example.dart';
import 'package:recipe_app/components/buttons/icon_button_example.dart';
import 'package:recipe_app/components/buttons/fab_example.dart';
import 'package:recipe_app/components/buttons/gesture_detector_example.dart';
import 'package:recipe_app/components/images_icons/image_example.dart';
import 'package:recipe_app/components/images_icons/icon_example.dart';
import 'package:recipe_app/components/images_icons/circle_avatar_example.dart';
import 'package:recipe_app/components/cards_tiles/card_example.dart';
import 'package:recipe_app/components/cards_tiles/list_tile_example.dart';
import 'package:recipe_app/components/cards_tiles/expansion_tile_example.dart';
import 'package:recipe_app/components/lists_scroll/list_view_example.dart';
import 'package:recipe_app/components/lists_scroll/grid_view_example.dart';
import 'package:recipe_app/components/lists_scroll/single_child_scroll_view_example.dart';
import 'package:recipe_app/components/lists_scroll/page_view_example.dart';
import 'package:recipe_app/components/lists_scroll/custom_scroll_view_example.dart';
import 'package:recipe_app/components/lists_scroll/refresh_indicator_example.dart';
import 'package:recipe_app/components/navigation/bottom_nav_bar_example.dart';
import 'package:recipe_app/components/navigation/navigation_rail_example.dart';
import 'package:recipe_app/components/navigation/drawer_example.dart';
import 'package:recipe_app/components/navigation/tab_bar_example.dart';
import 'package:recipe_app/components/navigation/snack_bar_example.dart';
import 'package:recipe_app/components/navigation/bottom_sheet_example.dart';
import 'package:recipe_app/components/dialogs_overlays/alert_dialog_example.dart';
import 'package:recipe_app/components/dialogs_overlays/date_time_picker_example.dart';
import 'package:recipe_app/components/dialogs_overlays/popup_menu_example.dart';
import 'package:recipe_app/components/forms/form_example.dart';
import 'package:recipe_app/components/forms/checkbox_radio_switch_example.dart';
import 'package:recipe_app/components/forms/slider_example.dart';
import 'package:recipe_app/components/forms/dropdown_example.dart';
import 'package:recipe_app/components/forms/stepper_toggle_buttons_example.dart';
import 'package:recipe_app/components/progress/progress_indicators_example.dart';
import 'package:recipe_app/components/data_display/app_bar_example.dart';
import 'package:recipe_app/components/data_display/chip_divider_example.dart';
import 'package:recipe_app/components/data_display/data_table_example.dart';
import 'package:recipe_app/components/animation_painting/animated_container_example.dart';
import 'package:recipe_app/components/animation_painting/animated_opacity_example.dart';
import 'package:recipe_app/components/animation_painting/hero_example.dart';
import 'package:recipe_app/components/animation_painting/tween_animation_example.dart';
import 'package:recipe_app/components/animation_painting/custom_painter_clip_example.dart';
import 'package:recipe_app/components/advanced/future_builder_example.dart';
import 'package:recipe_app/components/advanced/stream_builder_example.dart';
import 'package:recipe_app/components/advanced/media_query_example.dart';
import 'package:recipe_app/components/advanced/layout_builder_example.dart';
import 'package:recipe_app/components/advanced/responsive_layout_example.dart';

final List<ComponentItem> allComponents = [
  // ─── Layout & Positioning ──────────────────────────────────────
  ComponentItem(
    name: 'Container',
    explanation: 'A versatile box that can decorate, position, and size its child. '
        'The most commonly used layout widget in Flutter.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ContainerExample(),
    code: containerCode,
  ),
  ComponentItem(
    name: 'Row & Column',
    explanation: 'Row places children horizontally, Column places them vertically. '
        'Use mainAxisAlignment and crossAxisAlignment to control alignment.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const RowColumnExample(),
    code: rowColumnCode,
  ),
  ComponentItem(
    name: 'Stack & Positioned',
    explanation: 'Stack layers children on top of each other. Use Positioned to '
        'place children at specific offsets within the stack.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const StackExample(),
    code: stackCode,
  ),
  ComponentItem(
    name: 'Expanded & Flexible',
    explanation: 'Expanded fills available space proportionally. Flexible allows '
        'its child to be smaller than available space. Used inside Row, Column, or Flex.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ExpandedFlexibleExample(),
    code: expandedFlexibleCode,
  ),
  ComponentItem(
    name: 'SizedBox & Padding',
    explanation: 'SizedBox gives its child a fixed size. Padding adds empty space '
        'around its child. Both are essential for spacing in layouts.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const SizedBoxPaddingExample(),
    code: sizedBoxPaddingCode,
  ),
  ComponentItem(
    name: 'Center & Align',
    explanation: 'Center perfectly centers its child. Align positions a child '
        'within its bounds using the alignment property (topLeft, bottomRight, etc.).',
    category: layoutCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const CenterAlignExample(),
    code: centerAlignCode,
  ),
  ComponentItem(
    name: 'Wrap & FittedBox',
    explanation: 'Wrap automatically moves children to the next line when they '
        'overflow. FittedBox scales its child to fit within the available space.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const WrapFittedBoxExample(),
    code: wrapFittedBoxCode,
  ),
  ComponentItem(
    name: 'ConstrainedBox & AspectRatio',
    explanation: 'ConstrainedBox applies min/max size constraints. AspectRatio '
        'forces its child to maintain a specific width/height ratio.',
    category: layoutCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const ConstrainedBoxExample(),
    code: constrainedBoxCode,
  ),

  // ─── Text & Input ──────────────────────────────────────────────
  ComponentItem(
    name: 'Text',
    explanation: 'Displays a string of text with optional styling (font size, weight, '
        'color, letter spacing). Use maxLines and overflow for long text.',
    category: textInputCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const TextExample(),
    code: textCode,
  ),
  ComponentItem(
    name: 'TextField',
    explanation: 'A Material Design text input field. Use controller to read the '
        'value. Customize with InputDecoration (label, hint, icon, border).',
    category: textInputCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const TextFieldExample(),
    code: textFieldCode,
  ),
  ComponentItem(
    name: 'TextFormField',
    explanation: 'A Form-aware text field with built-in validation. Wrap in a Form '
        'widget and use GlobalKey<FormState> to validate all fields at once.',
    category: textInputCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const TextFormFieldExample(),
    code: textFormFieldCode,
  ),
  ComponentItem(
    name: 'RichText & SelectableText',
    explanation: 'RichText lets you mix multiple text styles in a single widget using '
        'TextSpan. SelectableText allows users to select and copy text.',
    category: textInputCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const RichTextExample(),
    code: richTextCode,
  ),

  // ─── Buttons & Gestures ────────────────────────────────────────
  ComponentItem(
    name: 'ElevatedButton, TextButton, OutlinedButton',
    explanation: 'The three main button types: ElevatedButton (primary, filled), '
        'TextButton (flat, minimal), OutlinedButton (medium emphasis, border).',
    category: buttonsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const MaterialButtonsExample(),
    code: materialButtonsCode,
  ),
  ComponentItem(
    name: 'IconButton',
    explanation: 'A circular button with an icon. Has variants: filled, filledTonal, '
        'and outlined. Use tooltip for accessibility.',
    category: buttonsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const IconButtonExample(),
    code: iconButtonCode,
  ),
  ComponentItem(
    name: 'FloatingActionButton',
    explanation: 'A floating action button for the primary action on a screen. '
        'Variants: small, large, extended (with label and icon).',
    category: buttonsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const FABExample(),
    code: fabCode,
  ),
  ComponentItem(
    name: 'GestureDetector',
    explanation: 'Detects tap, double-tap, long-press, drag, and other gestures '
        'on any widget. Essential for creating custom interactive elements.',
    category: buttonsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const GestureDetectorExample(),
    code: gestureDetectorCode,
  ),

  // ─── Images & Icons ────────────────────────────────────────────
  ComponentItem(
    name: 'Image (Asset & Network)',
    explanation: 'Displays images from assets (local files) or URLs. Use '
        'cached_network_image for efficient network images. BoxFit controls sizing.',
    category: imagesIconsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ImageExample(),
    code: imageCode,
  ),
  ComponentItem(
    name: 'Icon',
    explanation: 'Displays Material Design icons. Thousands available from '
        'Icons class. Customize size, color, and semantic label.',
    category: imagesIconsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const IconExample(),
    code: iconCode,
  ),
  ComponentItem(
    name: 'CircleAvatar',
    explanation: 'A circular avatar that can show initials, an image, or an icon. '
        'Commonly used for user profiles in ListTiles and Cards.',
    category: imagesIconsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const CircleAvatarExample(),
    code: circleAvatarCode,
  ),

  // ─── Cards & Tiles ─────────────────────────────────────────────
  ComponentItem(
    name: 'Card',
    explanation: 'A Material Design surface that groups related content. '
        'Customize with elevation, shape, color, and any child widgets.',
    category: cardsTilesCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const CardExample(),
    code: cardCode,
  ),
  ComponentItem(
    name: 'ListTile & Specialized Tiles',
    explanation: 'A single row in a list with leading icon, title, subtitle, and '
        'trailing widget. Specialized versions: SwitchListTile, CheckboxListTile, RadioListTile.',
    category: cardsTilesCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ListTileExample(),
    code: listTileCode,
  ),
  ComponentItem(
    name: 'ExpansionTile',
    explanation: 'A tile that expands to reveal children on tap. Useful for '
        'collapsible sections, FAQs, or nested navigation.',
    category: cardsTilesCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ExpansionTileExample(),
    code: expansionTileCode,
  ),

  // ─── Lists & Scroll ────────────────────────────────────────────
  ComponentItem(
    name: 'ListView',
    explanation: 'A scrollable list of items. For large lists, use ListView.builder '
        'which lazily builds items as they scroll into view.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ListViewExample(),
    code: listViewCode,
  ),
  ComponentItem(
    name: 'GridView',
    explanation: 'A scrollable grid of items. Use SliverGridDelegateWithFixedCrossAxisCount '
        'for a fixed number of columns, or WithMaxCrossAxisExtent for dynamic columns.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const GridViewExample(),
    code: gridViewCode,
  ),
  ComponentItem(
    name: 'SingleChildScrollView',
    explanation: 'Makes a single widget scrollable when its content overflows. '
        'Useful for forms or screens with content that may exceed the viewport.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const SingleChildScrollViewExample(),
    code: singleChildScrollViewCode,
  ),
  ComponentItem(
    name: 'PageView',
    explanation: 'A swipeable page-view widget. Each page is a full-screen child. '
        'Use PageController and indicator dots for navigation cues.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const PageViewExample(),
    code: pageViewCode,
  ),
  ComponentItem(
    name: 'CustomScrollView & Slivers',
    explanation: 'A scroll view that uses slivers for custom scroll effects. '
        'Combine SliverAppBar, SliverList, SliverGrid, and SliverToBoxAdapter.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const CustomScrollViewExample(),
    code: customScrollViewCode,
  ),
  ComponentItem(
    name: 'RefreshIndicator',
    explanation: 'Wraps a scrollable widget and adds pull-to-refresh. '
        'The onRefresh callback should return a Future that completes when data is loaded.',
    category: listsScrollCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const RefreshIndicatorExample(),
    code: refreshIndicatorCode,
  ),

  // ─── Navigation ────────────────────────────────────────────────
  ComponentItem(
    name: 'NavigationBar (Bottom)',
    explanation: 'Modern Material 3 bottom navigation. Replace the old '
        'BottomNavigationBar with NavigationBar for the latest design.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const BottomNavBarExample(),
    code: bottomNavBarCode,
  ),
  ComponentItem(
    name: 'NavigationRail',
    explanation: 'Side navigation bar for tablets and desktops. Use alongside '
        'NavigationBar on phones for adaptive navigation.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const NavigationRailExample(),
    code: navigationRailCode,
  ),
  ComponentItem(
    name: 'Drawer',
    explanation: 'A slide-in side panel with navigation options. Uses DrawerHeader '
        'for profile info and ListTile for menu items.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const DrawerExample(),
    code: drawerCode,
  ),
  ComponentItem(
    name: 'TabBar & TabBarView',
    explanation: 'Tabbed interface with swipeable pages. Wrap in DefaultTabController '
        'or use a manual TabController for programmatic control.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const TabBarExample(),
    code: tabBarCode,
  ),
  ComponentItem(
    name: 'SnackBar',
    explanation: 'A lightweight message bar at the bottom. Can include an action button. '
        'Use ScaffoldMessenger to show it. Works across route changes.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const SnackBarExample(),
    code: snackBarCode,
  ),
  ComponentItem(
    name: 'BottomSheet',
    explanation: 'A modal sheet that slides up from the bottom. Use showModalBottomSheet '
        'for temporary content or actions related to the current screen.',
    category: navigationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const BottomSheetExample(),
    code: bottomSheetCode,
  ),

  // ─── Dialogs & Overlays ────────────────────────────────────────
  ComponentItem(
    name: 'AlertDialog & SimpleDialog',
    explanation: 'AlertDialog shows a confirmation/info popup with title, content, '
        'and actions. SimpleDialog shows a list of options to choose from.',
    category: dialogsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const AlertDialogExample(),
    code: alertDialogCode,
  ),
  ComponentItem(
    name: 'DatePicker & TimePicker',
    explanation: 'Material date and time pickers. showDatePicker returns a DateTime, '
        'showTimePicker returns a TimeOfDay.',
    category: dialogsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const DateTimePickerExample(),
    code: dateTimePickerCode,
  ),
  ComponentItem(
    name: 'PopupMenuButton & Tooltip',
    explanation: 'PopupMenuButton shows a dropdown menu on tap. Tooltip shows a '
        'helpful message on long-press or hover.',
    category: dialogsCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const PopupMenuExample(),
    code: popupMenuCode,
  ),

  // ─── Forms & Selection ─────────────────────────────────────────
  ComponentItem(
    name: 'Form with Validation',
    explanation: 'A Form widget with GlobalKey that validates all TextFormField '
        'children. Each field\'s validator returns an error string or null.',
    category: formsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const FormExample(),
    code: formCode,
  ),
  ComponentItem(
    name: 'Checkbox, Radio & Switch',
    explanation: 'Selection widgets: Checkbox (multiple choice), Radio (single choice), '
        'Switch (on/off). Use the *ListTile variants for labeled versions.',
    category: formsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const CheckboxRadioSwitchExample(),
    code: checkboxRadioSwitchCode,
  ),
  ComponentItem(
    name: 'Slider & RangeSlider',
    explanation: 'Slider selects a single value, RangeSlider selects a range. '
        'Use divisions for discrete steps and labels for value display.',
    category: formsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const SliderExample(),
    code: sliderCode,
  ),
  ComponentItem(
    name: 'DropdownButton',
    explanation: 'A dropdown menu for selecting from a list of options. '
        'DropdownButtonFormField integrates with Form for validation.',
    category: formsCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const DropdownExample(),
    code: dropdownCode,
  ),
  ComponentItem(
    name: 'Stepper & ToggleButtons',
    explanation: 'Stepper provides a step-by-step wizard interface. '
        'ToggleButtons allows multi-select toggle groups (like bold/italic/underline).',
    category: formsCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const StepperToggleButtonsExample(),
    code: stepperToggleButtonsCode,
  ),

  // ─── Progress & Activity ───────────────────────────────────────
  ComponentItem(
    name: 'LinearProgress & CircularProgress',
    explanation: 'Progress indicators show loading states. Use indeterminate '
        '(spinning) for unknown duration, determinate (value: 0.0-1.0) for known progress.',
    category: progressCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ProgressIndicatorsExample(),
    code: progressIndicatorsCode,
  ),

  // ─── Material Components ───────────────────────────────────────
  ComponentItem(
    name: 'AppBar',
    explanation: 'The top app bar with title, leading icon, actions, and optional '
        'bottom widget. Supports scrolling effects (elevation, sliver integration).',
    category: materialCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const AppBarExample(),
    code: appBarCode,
  ),
  ComponentItem(
    name: 'Chip & Divider',
    explanation: 'Chips represent tags, choices, or people. Variants: InputChip, '
        'FilterChip, ActionChip. Divider adds a horizontal or vertical line.',
    category: materialCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const ChipDividerExample(),
    code: chipDividerCode,
  ),
  ComponentItem(
    name: 'DataTable & Badge',
    explanation: 'DataTable displays tabular data with sortable columns. '
        'Badge shows a notification count or dot on a widget.',
    category: materialCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const DataTableExample(),
    code: dataTableCode,
  ),

  // ─── Animation & Motion ────────────────────────────────────────
  ComponentItem(
    name: 'AnimatedContainer',
    explanation: 'A container that smoothly animates changes to its size, color, '
        'border, border-radius, padding, and alignment over a duration.',
    category: animationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const AnimatedContainerExample(),
    code: animatedContainerCode,
  ),
  ComponentItem(
    name: 'AnimatedOpacity',
    explanation: 'Fades a widget in or out smoothly. Use with a boolean state '
        'to toggle visibility with a fade transition.',
    category: animationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const AnimatedOpacityExample(),
    code: animatedOpacityCode,
  ),
  ComponentItem(
    name: 'Hero Animation',
    explanation: 'Creates a shared-element transition between two routes. Widgets '
        'with the same tag animate seamlessly from source to destination.',
    category: animationCategory,
    difficulty: ComponentDifficulty.beginner,
    widgetBuilder: (_) => const HeroExample(),
    code: heroCode,
  ),
  ComponentItem(
    name: 'TweenAnimationBuilder & AnimatedBuilder',
    explanation: 'TweenAnimationBuilder auto-animates between values. '
        'AnimatedBuilder lets you build custom animations with an AnimationController.',
    category: animationCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const TweenAnimationExample(),
    code: tweenAnimationCode,
  ),
  ComponentItem(
    name: 'CustomPainter, Clip & Transform',
    explanation: 'CustomPainter draws anything on a canvas. ClipPath/RRect clip widgets '
        'to shapes. Transform rotates, scales, or translates widgets.',
    category: animationCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const CustomPainterClipExample(),
    code: customPainterCode,
  ),

  // ─── Advanced & Utilities ──────────────────────────────────────
  ComponentItem(
    name: 'FutureBuilder',
    explanation: 'A widget that builds itself based on the state of a Future. '
        'Handles loading, error, and completed states elegantly.',
    category: advancedCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const FutureBuilderExample(),
    code: futureBuilderCode,
  ),
  ComponentItem(
    name: 'StreamBuilder',
    explanation: 'A widget that listens to a Stream and rebuilds on each event. '
        'Ideal for real-time data like chat, location, or Firebase.',
    category: advancedCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const StreamBuilderExample(),
    code: streamBuilderCode,
  ),
  ComponentItem(
    name: 'MediaQuery',
    explanation: 'Access device information: screen size, orientation, safe area '
        'insets, text scale, pixel density. Essential for responsive layouts.',
    category: advancedCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const MediaQueryExample(),
    code: mediaQueryCode,
  ),
  ComponentItem(
    name: 'LayoutBuilder & OrientationBuilder',
    explanation: 'LayoutBuilder builds based on parent size constraints. '
        'OrientationBuilder responds to device orientation changes.',
    category: advancedCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const LayoutBuilderExample(),
    code: layoutBuilderCode,
  ),
  ComponentItem(
    name: 'Responsive Layout Pattern',
    explanation: 'Combine LayoutBuilder with breakpoints to build layouts that '
        'adapt to phone (narrow), tablet (medium), and desktop (wide) screens.',
    category: advancedCategory,
    difficulty: ComponentDifficulty.advanced,
    widgetBuilder: (_) => const ResponsiveLayoutExample(),
    code: responsiveLayoutCode,
  ),
];

List<ComponentCategory> getCategoriesWithComponents() {
  final categorySet = <String>{};
  final categories = <ComponentCategory>[];
  for (final component in allComponents) {
    if (categorySet.add(component.category.name)) {
      categories.add(component.category);
    }
  }
  return categories;
}

List<ComponentItem> getComponentsForCategory(ComponentCategory category) {
  return allComponents.where((c) => c.category.name == category.name).toList();
}
