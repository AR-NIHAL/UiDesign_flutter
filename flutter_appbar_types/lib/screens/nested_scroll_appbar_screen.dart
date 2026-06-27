import 'package:flutter/material.dart';

class NestedScrollAppBarScreen extends StatelessWidget {
  const NestedScrollAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Posts', 'Photos', 'Videos', 'About'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: const Text('Profile'),
                pinned: true,
                expandedHeight: 250,
                forceElevated: innerScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: Colors.teal[800]),
                        loadingBuilder: (_, child, progress) {
                          if (progress == null) return child;
                          return Container(color: Colors.teal[200]);
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
                      Positioned(
                        left: 16,
                        bottom: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'John Doe',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Flutter Developer',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white70,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  tabs: tabs.map((t) => Tab(text: t)).toList(),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: tabs.map((tab) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (context) => CustomScrollView(
                    key: PageStorageKey<String>(tab),
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$tab Content',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              ...List.generate(
                                12,
                                (i) => Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(child: Text('${i + 1}')),
                                    title: Text('$tab item ${i + 1}'),
                                    subtitle: Text('NestedScrollView demo'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
