import 'package:flutter/material.dart';

class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({super.key});

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data loaded successfully!';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('FutureBuilder:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Simulates a 2-second network request:',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          FutureBuilder<String>(
            future: _fetchData(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 12),
                        Text('Loading...'),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 40),
                        const SizedBox(height: 8),
                        Text('Error: ${snapshot.error}'),
                      ],
                    ),
                  ),
                );
              }
              return Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Icon(Icons.check_circle,
                          color: Colors.green, size: 40),
                      const SizedBox(height: 8),
                      Text(snapshot.data ?? ''),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

const futureBuilderCode = '''// FutureBuilder: async data fetching with loading/error/success states
FutureBuilder<String>(
  future: _fetchData(),  // returns Future<String>
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();  // Loading
    }
    if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');  // Error
    }
    return Text(snapshot.data ?? '');  // Success
  },
)

// States: none, waiting (loading), active (stream), done (complete)''';
