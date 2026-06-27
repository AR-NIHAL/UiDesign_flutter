import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AnimatedAppBarScreen extends StatefulWidget {
  const AnimatedAppBarScreen({super.key});

  @override
  State<AnimatedAppBarScreen> createState() => _AnimatedAppBarScreenState();
}

class _AnimatedAppBarScreenState extends State<AnimatedAppBarScreen> {
  final _scrollController = ScrollController();
  bool _isVisible = true;
  double _lastScroll = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final current = _scrollController.offset;
    if (current > _lastScroll && current > 60 && _isVisible) {
      setState(() => _isVisible = false);
    } else if (current < _lastScroll && !_isVisible) {
      setState(() => _isVisible = true);
    }
    _lastScroll = current;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Animated AppBar'),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Scroll-Driven Animations', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    'This page demonstrates various animation techniques '
                    'for AppBars using animate_do and implicit animations.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.visibility, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text('Fade In Up', style: theme.textTheme.titleSmall),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Content fades in and slides up when entering the viewport.'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  BounceInLeft(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_back, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text('Bounce In Left', style: theme.textTheme.titleSmall),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Elements bounce in from the left side.'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ZoomIn(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.zoom_in, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text('Zoom In', style: theme.textTheme.titleSmall),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Elements scale up from zero to full size.'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FlipInX(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.flip, color: theme.colorScheme.primary),
                                const SizedBox(width: 8),
                                Text('Flip In X', style: theme.textTheme.titleSmall),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text('Elements flip in along the X axis.'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeIn(
                    child: Card(
                      color: theme.colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hide/Show on Scroll',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _isVisible
                                  ? 'The AppBar is currently VISIBLE. Scroll down to hide it.'
                                  : 'The AppBar is currently HIDDEN. Scroll up to show it.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(
                    15,
                    (i) => FadeInUp(
                      delay: Duration(milliseconds: i * 50),
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(child: Text('${i + 1}')),
                          title: Text('Animated item ${i + 1}'),
                          subtitle: Text('Staggered fade-in animation'),
                        ),
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
}
