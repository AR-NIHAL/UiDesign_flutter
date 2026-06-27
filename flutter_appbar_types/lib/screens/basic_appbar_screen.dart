import 'package:flutter/material.dart';

class BasicAppBarScreen extends StatefulWidget {
  const BasicAppBarScreen({super.key});

  @override
  State<BasicAppBarScreen> createState() => _BasicAppBarScreenState();
}

class _BasicAppBarScreenState extends State<BasicAppBarScreen> {
  bool _useM3 = true;
  bool _centerTitle = true;
  bool _showLeading = true;
  bool _showActions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _showLeading
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text('Basic AppBar'),
        centerTitle: _centerTitle,
        actions: _showActions
            ? [
                IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
                IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              ]
            : null,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Configuration', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Material 3'),
            subtitle: const Text('Toggle Material 3 styling (app theme)'),
            value: _useM3,
            onChanged: (v) => setState(() => _useM3 = v),
          ),
          SwitchListTile(
            title: const Text('Center title'),
            value: _centerTitle,
            onChanged: (v) => setState(() => _centerTitle = v),
          ),
          SwitchListTile(
            title: const Text('Show leading'),
            value: _showLeading,
            onChanged: (v) => setState(() => _showLeading = v),
          ),
          SwitchListTile(
            title: const Text('Show actions'),
            value: _showActions,
            onChanged: (v) => setState(() => _showActions = v),
          ),
          const SizedBox(height: 24),
          Text('Examples', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          _exampleCard(
            context,
            'Default AppBar',
            'Simple title, no extras',
            AppBar(title: const Text('Title')),
          ),
          _exampleCard(
            context,
            'Full AppBar',
            'Leading + title + actions',
            AppBar(
              leading: const Icon(Icons.menu),
              title: const Text('Full'),
              actions: const [
                Icon(Icons.search),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          _exampleCard(
            context,
            'Colored AppBar',
            'Custom background & foreground',
            AppBar(
              title: const Text('Colored'),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              elevation: 2,
            ),
          ),
          _exampleCard(
            context,
            'Compact AppBar',
            'Smaller toolbar height',
            AppBar(
              title: const Text('Compact'),
              toolbarHeight: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleCard(BuildContext context, String title, String subtitle, AppBar appBar) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Text(title, style: Theme.of(context).textTheme.titleSmall),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
            child: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          ),
          appBar,
          const SizedBox(height: 8),
        ],
      ),
    );
  }

}
