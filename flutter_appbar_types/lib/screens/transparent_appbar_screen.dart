import 'package:flutter/material.dart';

class TransparentAppBarScreen extends StatefulWidget {
  const TransparentAppBarScreen({super.key});

  @override
  State<TransparentAppBarScreen> createState() => _TransparentAppBarScreenState();
}

class _TransparentAppBarScreenState extends State<TransparentAppBarScreen> {
  final _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() => _scrollOffset = _scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final opacity = (_scrollOffset / 200).clamp(0.0, 1.0);
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: opacity < 0.5 ? Colors.white : null),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.indigo[900]),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return Container(color: Colors.indigo[300]);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: theme.colorScheme.surface.withValues(alpha: opacity),
            surfaceTintColor: theme.colorScheme.surfaceTint.withValues(alpha: opacity),
            foregroundColor: Color.lerp(Colors.white, theme.colorScheme.onSurface, opacity),
            elevation: opacity * 4,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transparent Overlay AppBar', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'This AppBar starts fully transparent and gradually transitions '
                    'to a solid surface color as you scroll down. The text and icons '
                    'also change from white to the theme color.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Scroll Feedback', style: theme.textTheme.titleSmall),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: opacity,
                            backgroundColor: theme.colorScheme.surfaceContainerHighest,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Opacity: ${(opacity * 100).toStringAsFixed(0)}%',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Techniques Used', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  _techniqueItem(context, 'Scroll-driven opacity via Color.lerp'),
                  _techniqueItem(context, 'Animated surface tint color'),
                  _techniqueItem(context, 'Dynamic elevation from 0 to 4'),
                  _techniqueItem(context, 'Foreground color lerp (white → onSurface)'),
                  _techniqueItem(context, 'Gradient overlay on background image'),
                  const SizedBox(height: 24),
                  ...List.generate(
                    20,
                    (i) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${i + 1}')),
                        title: Text('Photo ${i + 1}'),
                        subtitle: Text('Scroll to see the AppBar transition'),
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

  Widget _techniqueItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
