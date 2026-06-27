import 'package:flutter/material.dart';

class PopupMenuExample extends StatelessWidget {
  const PopupMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: $value')),
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'edit', child: ListTile(
                leading: Icon(Icons.edit), title: Text('Edit'),
              )),
              const PopupMenuItem(value: 'share', child: ListTile(
                leading: Icon(Icons.share), title: Text('Share'),
              )),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'delete', child: ListTile(
                leading: Icon(Icons.delete, color: Colors.red), title: Text('Delete'),
              )),
            ],
            child: const Chip(
              avatar: Icon(Icons.more_vert, size: 18),
              label: Text('Menu'),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Tooltip:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 12,
            children: [
              Tooltip(message: 'Save', child: Icon(Icons.save, size: 32)),
              Tooltip(
                message: 'This is a longer tooltip',
                preferBelow: false,
                child: Icon(Icons.info_outline, size: 32, color: Colors.blue),
              ),
              Tooltip(
                message: 'Delete',
                triggerMode: TooltipTriggerMode.tap,
                child: Icon(Icons.delete, size: 32, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const popupMenuCode = '''// PopupMenuButton: dropdown menu on tap
PopupMenuButton<String>(
  onSelected: (value) { /* handle selection */ },
  itemBuilder: (_) => [
    PopupMenuItem(value: 'edit', child: ListTile(leading: Icon(Icons.edit), title: Text('Edit'))),
    PopupMenuItem(value: 'share', child: ListTile(leading: Icon(Icons.share), title: Text('Share'))),
    PopupMenuDivider(),
    PopupMenuItem(value: 'delete', child: ListTile(leading: Icon(Icons.delete), title: Text('Delete'))),
  ],
  child: Icon(Icons.more_vert),
)

// Tooltip: contextual info on long-press
Tooltip(message: 'Save', child: Icon(Icons.save))
Tooltip(message: 'Info', preferBelow: false, child: Icon(Icons.info))
Tooltip(message: 'Tap to delete', triggerMode: TooltipTriggerMode.tap, child: Icon(Icons.delete))''';
