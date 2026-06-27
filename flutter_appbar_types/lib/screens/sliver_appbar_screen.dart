import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({super.key});

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  bool _pinned = true;
  bool _floating = false;
  bool _snap = false;
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            floating: _floating,
            snap: _snap,
            expandedHeight: _expanded ? 200 : kToolbarHeight,
            flexibleSpace: _expanded
                ? FlexibleSpaceBar(
                    title: const Text('SliverAppBar'),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6750A4), Color(0xFF9C82C0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  )
                : null,
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Configuration', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Pinned'),
                    subtitle: const Text('Stays visible at top when collapsed'),
                    value: _pinned,
                    onChanged: (v) => setState(() {
                      _pinned = v;
                      if (v) _floating = false;
                    }),
                  ),
                  SwitchListTile(
                    title: const Text('Floating'),
                    subtitle: const Text('Reappears on reverse scroll'),
                    value: _floating,
                    onChanged: (v) => setState(() {
                      _floating = v;
                      if (v) _pinned = false;
                    }),
                  ),
                  SwitchListTile(
                    title: const Text('Snap'),
                    subtitle: const Text('Snaps fully open (requires floating)'),
                    value: _snap,
                    onChanged: _floating ? (v) => setState(() => _snap = v) : null,
                  ),
                  SwitchListTile(
                    title: const Text('Expanded'),
                    subtitle: const Text('Show expanded flexible space'),
                    value: _expanded,
                    onChanged: (v) => setState(() => _expanded = v),
                  ),
                  const SizedBox(height: 16),
                  Text('Scroll down to see collapse behavior',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          )),
                  const SizedBox(height: 16),
                  ...List.generate(
                    20,
                    (i) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${i + 1}')),
                        title: Text('List item ${i + 1}'),
                        subtitle: Text('SliverAppBar demo item'),
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
