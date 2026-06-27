import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/components_data.dart';
import 'package:recipe_app/models/component_model.dart';
import 'package:recipe_app/providers/filter_provider.dart';
import 'package:recipe_app/screens/category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Components'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'All',
                  style: TextStyle(
                    fontSize: 12,
                    color: filter.showEssentialsOnly ? Colors.white54 : Colors.white,
                  ),
                ),
                Switch(
                  value: filter.showEssentialsOnly,
                  onChanged: (v) => filter.setShowEssentialsOnly(v),
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>((_) =>
                      const Icon(Icons.school, size: 14)),
                ),
                Text(
                  'Essentials',
                  style: TextStyle(
                    fontSize: 12,
                    color: filter.showEssentialsOnly ? Colors.white : Colors.white54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Consumer<FilterProvider>(
        builder: (_, filter, __) {
          final categoriesToShow = getCategoriesWithComponents();

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            itemCount: categoriesToShow.length + 1,
            itemBuilder: (_, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.widgets_outlined,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 8),
                          Text(
                            filter.showEssentialsOnly
                                ? 'Essential Components'
                                : 'All Components',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        filter.showEssentialsOnly
                            ? 'Core widgets for everyday Flutter development'
                            : 'Every component included in this showcase',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final category = categoriesToShow[index - 1];
              final componentsInCategory = getComponentsForCategory(category);
              final filtered = filter.filterComponents(componentsInCategory);

              if (filtered.isEmpty) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _CategoryCard(
                  category: category,
                  componentCount: filtered.length,
                  totalCount: componentsInCategory.length,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryScreen(category: category),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final ComponentCategory category;
  final int componentCount;
  final int totalCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.componentCount,
    required this.totalCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final showEssentials =
        context.watch<FilterProvider>().showEssentialsOnly;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  category.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      category.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  showEssentials
                      ? '$componentCount'
                      : '$componentCount/$totalCount',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
