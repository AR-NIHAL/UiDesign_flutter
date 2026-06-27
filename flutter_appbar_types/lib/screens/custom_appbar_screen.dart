import 'package:flutter/material.dart';

class CustomAppBarScreen extends StatelessWidget {
  const CustomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(
              bottom: BorderSide(color: theme.colorScheme.outlineVariant),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: MediaQuery.of(context).padding.top + 8,
              bottom: 8,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Custom AppBar',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Custom PreferredSize AppBar', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'This is a fully custom AppBar using PreferredSize. It contains a two-row layout '
            'with a profile avatar, notification bell, search bar, and back button.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Text('Use Cases', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _useCaseCard(
            context,
            'E-commerce',
            'Search bar + cart + profile',
            Icons.shopping_bag,
          ),
          _useCaseCard(
            context,
            'Social Media',
            'Avatar + notifications + stories',
            Icons.people,
          ),
          _useCaseCard(
            context,
            'News App',
            'Categories + search + bookmark',
            Icons.article,
          ),
          _useCaseCard(
            context,
            'Music Player',
            'Now playing + controls + queue',
            Icons.music_note,
          ),
          const SizedBox(height: 24),
          Text('Content', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ...List.generate(
            15,
            (i) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text('Custom AppBar item ${i + 1}'),
                subtitle: Text('Fully custom PreferredSize layout'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _useCaseCard(BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
