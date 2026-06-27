import 'package:flutter/material.dart';
import 'package:recipe_app/models/component_model.dart';

final layoutCategory = ComponentCategory(
  name: 'Layout & Positioning',
  description: 'Container, Row, Column, Stack, Expanded, and more',
  icon: Icons.grid_view_rounded,
);

final textInputCategory = ComponentCategory(
  name: 'Text & Input',
  description: 'Text, TextField, RichText, and related widgets',
  icon: Icons.text_fields_rounded,
);

final buttonsCategory = ComponentCategory(
  name: 'Buttons & Gestures',
  description: 'ElevatedButton, TextButton, GestureDetector, and more',
  icon: Icons.smart_button_rounded,
);

final imagesIconsCategory = ComponentCategory(
  name: 'Images & Icons',
  description: 'Image, Icon, CircleAvatar, and related',
  icon: Icons.image_rounded,
);

final cardsTilesCategory = ComponentCategory(
  name: 'Cards & Tiles',
  description: 'Card, ListTile, ExpansionTile, and tile widgets',
  icon: Icons.dashboard_rounded,
);

final listsScrollCategory = ComponentCategory(
  name: 'Lists & Scroll',
  description: 'ListView, GridView, PageView, CustomScrollView',
  icon: Icons.list_alt_rounded,
);

final navigationCategory = ComponentCategory(
  name: 'Navigation',
  description: 'BottomNav, Drawer, TabBar, SnackBar, BottomSheet',
  icon: Icons.navigation_rounded,
);

final dialogsCategory = ComponentCategory(
  name: 'Dialogs & Overlays',
  description: 'AlertDialog, DatePicker, Tooltip, PopupMenu',
  icon: Icons.chat_bubble_rounded,
);

final formsCategory = ComponentCategory(
  name: 'Forms & Selection',
  description: 'Form, Checkbox, Radio, Switch, Slider, Dropdown',
  icon: Icons.checklist_rounded,
);

final progressCategory = ComponentCategory(
  name: 'Progress & Activity',
  description: 'LinearProgress, CircularProgress, Stepper, ToggleButtons',
  icon: Icons.pending_rounded,
);

final materialCategory = ComponentCategory(
  name: 'Material Components',
  description: 'AppBar, Chip, Divider, Badge, DataTable',
  icon: Icons.widgets_rounded,
);

final animationCategory = ComponentCategory(
  name: 'Animation & Motion',
  description: 'AnimatedContainer, Hero, TweenAnimation, CustomPainter',
  icon: Icons.animation_rounded,
);

final advancedCategory = ComponentCategory(
  name: 'Advanced & Utilities',
  description: 'FutureBuilder, MediaQuery, LayoutBuilder, responsive layout',
  icon: Icons.tune_rounded,
);

final List<ComponentCategory> allCategories = [
  layoutCategory,
  textInputCategory,
  buttonsCategory,
  imagesIconsCategory,
  cardsTilesCategory,
  listsScrollCategory,
  navigationCategory,
  dialogsCategory,
  formsCategory,
  progressCategory,
  materialCategory,
  animationCategory,
  advancedCategory,
];
