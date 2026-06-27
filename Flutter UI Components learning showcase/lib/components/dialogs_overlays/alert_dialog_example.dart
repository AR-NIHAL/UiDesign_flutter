import 'package:flutter/material.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete item?'),
                  content: const Text(
                    'Are you sure you want to delete this item? This action cannot be undone.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show alert dialog'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => SimpleDialog(
                  title: const Text('Choose option'),
                  children: [
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Gallery'),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text('Camera'),
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Link'),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show simple dialog'),
          ),
        ],
      ),
    );
  }
}

const alertDialogCode = '''// AlertDialog: confirmation or information
showDialog(
  context: context,
  builder: (_) => AlertDialog(
    title: Text('Delete item?'),
    content: Text('Are you sure?'),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
      TextButton(onPressed: () => Navigator.pop(context), child: Text('Delete')),
    ],
  ),
)

// SimpleDialog: list of options
showDialog(
  context: context,
  builder: (_) => SimpleDialog(
    title: Text('Choose option'),
    children: [
      SimpleDialogOption(
        onPressed: () => Navigator.pop(context),
        child: ListTile(leading: Icon(Icons.photo), title: Text('Gallery')),
      ),
      // more options...
    ],
  ),
)''';
