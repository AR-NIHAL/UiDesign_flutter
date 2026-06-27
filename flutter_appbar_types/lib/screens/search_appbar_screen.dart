import 'package:flutter/material.dart';

class SearchAppBarScreen extends StatelessWidget {
  const SearchAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search AppBar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: _FoodSearchDelegate()),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Try searching', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...['Pizza', 'Burger', 'Sushi', 'Pasta', 'Salad', 'Tacos', 'Ramen', 'Curry'].map(
            (food) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(Icons.restaurant, color: Theme.of(context).colorScheme.primary),
                title: Text(food),
                subtitle: Text('Tap search icon to find $food'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodSearchDelegate extends SearchDelegate<String?> {
  static const _allFood = [
    'Pizza', 'Pepperoni Pizza', 'Margherita Pizza',
    'Burger', 'Cheese Burger', 'Double Burger',
    'Sushi', 'Sushi Roll', 'Sashimi',
    'Pasta', 'Spaghetti', 'Fettuccine',
    'Salad', 'Caesar Salad', 'Greek Salad',
    'Tacos', 'Chicken Tacos', 'Beef Tacos',
    'Ramen', 'Miso Ramen', 'Tonkotsu Ramen',
    'Curry', 'Thai Curry', 'Japanese Curry',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final results = _allFood.where((f) => f.toLowerCase().contains(query.toLowerCase())).toList();
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off, size: 64, color: Theme.of(context).colorScheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text('No results found', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (_, i) => ListTile(
        leading: const Icon(Icons.restaurant),
        title: Text(results[i]),
        onTap: () {
          query = results[i];
          showResults(context);
        },
      ),
    );
  }
}
