import 'package:flutter/material.dart';

class FlexibleSpaceBarScreen extends StatelessWidget {
  const FlexibleSpaceBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('National Park'),
              centerTitle: true,
              titlePadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 72,
                right: 72,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.green[700]),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return Container(color: Colors.green[200]);
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FlexibleSpaceBar', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'The FlexibleSpaceBar provides a parallax scrolling effect with a background image '
                    'that animates as the user scrolls. It supports:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  _featureItem(context, 'Parallax scrolling', Icons.swap_vert),
                  _featureItem(context, 'Stretch modes (zoom, blur)', Icons.photo_size_select_large),
                  _featureItem(context, 'Gradient overlay', Icons.gradient),
                  _featureItem(context, 'Custom title padding', Icons.space_bar),
                  const SizedBox(height: 24),
                  Text('Stretch Effect', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Pull down past the overscroll to see the stretch effect with blur and zoom.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    15,
                    (i) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(Icons.landscape),
                        title: Text('Trail ${i + 1}'),
                        subtitle: Text('Explore the ${['forest', 'lake', 'mountain', 'valley', 'river'][i % 5]}'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem(BuildContext context, String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
