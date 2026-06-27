import 'package:flutter/material.dart';
import 'package:recipe_app/core/widgets/code_block.dart';
import 'package:recipe_app/core/widgets/difficulty_badge.dart';
import 'package:recipe_app/models/component_model.dart';

class ComponentDetailScreen extends StatelessWidget {
  final ComponentItem component;

  const ComponentDetailScreen({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(component.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: DifficultyBadge(isBeginner: component.isBeginner),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explanation section
            Text(
              'What it is',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest
                    .withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant,
                ),
              ),
              child: Text(
                component.explanation,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Live preview section
            Text(
              'Live Preview',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant,
                ),
              ),
              child: component.widgetBuilder(context),
            ),

            const SizedBox(height: 24),

            // Code section
            Row(
              children: [
                Text(
                  'Code',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(tap to select & copy)',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CodeBlock(code: component.code),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
