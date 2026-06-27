import 'package:flutter/foundation.dart';
import 'package:recipe_app/models/component_model.dart';

class FilterProvider extends ChangeNotifier {
  bool _showEssentialsOnly = true;

  bool get showEssentialsOnly => _showEssentialsOnly;

  void toggle() {
    _showEssentialsOnly = !_showEssentialsOnly;
    notifyListeners();
  }

  void setShowEssentialsOnly(bool value) {
    if (_showEssentialsOnly != value) {
      _showEssentialsOnly = value;
      notifyListeners();
    }
  }

  List<ComponentItem> filterComponents(List<ComponentItem> items) {
    if (_showEssentialsOnly) {
      return items.where((c) => c.isBeginner).toList();
    }
    return items;
  }
}
