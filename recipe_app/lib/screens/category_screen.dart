import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/components_data.dart';
import 'package:recipe_app/core/widgets/component_card.dart';
import 'package:recipe_app/models/component_model.dart';
import 'package:recipe_app/providers/filter_provider.dart';
import 'package:recipe_app/screens/component_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final ComponentCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterProvider>();
    final allInCategory = getComponentsForCategory(category);
    final filtered = filter.filterComponents(allInCategory);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(category.icon, size: 22),
            const SizedBox(width: 8),
            Text(category.name),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              '${filtered.length} component${filtered.length == 1 ? '' : 's'} '
              '${filter.showEssentialsOnly ? '(essentials only)' : ''}',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No essential components in this category yet.',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton.icon(
                          onPressed: () =>
                              filter.setShowEssentialsOnly(false),
                          icon: const Icon(Icons.visibility),
                          label: const Text('Show all'),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 4, bottom: 24),
                    itemCount: filtered.length,
                    itemBuilder: (_, i) {
                      final component = filtered[i];
                      return ComponentCard(
                        component: component,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ComponentDetailScreen(component: component),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
