import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late StreamController<int> _controller;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('StreamBuilder:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Click to emit events to the stream:',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          StreamBuilder<int>(
            stream: _controller.stream,
            initialData: 0,
            builder: (_, snapshot) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const Text('Stream count'),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _controller.sink.add(++_counter),
            child: const Text('Add to stream'),
          ),
        ],
      ),
    );
  }
}

const streamBuilderCode = '''// StreamBuilder: react to a stream of data events
StreamController<int> controller = StreamController<int>();

StreamBuilder<int>(
  stream: controller.stream,
  initialData: 0,
  builder: (context, snapshot) {
    return Text('\${snapshot.data}');
  },
)

// Emit data:
controller.sink.add(42);

// Don't forget to close the controller when done:
controller.close();

// Common uses: real-time updates, WebSockets, Firebase, location''';
