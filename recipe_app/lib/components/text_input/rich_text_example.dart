import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('RichText:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                const TextSpan(
                  text: 'RichText ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                TextSpan(
                  text: 'lets you mix ',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                TextSpan(
                  text: 'styles',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const TextSpan(
                  text: ' inline!',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('SelectableText:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const SelectableText(
            'You can select and copy this text!',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

const richTextCode = '''// RichText: multiple styles in one text
RichText(
  text: TextSpan(
    style: DefaultTextStyle.of(context).style,
    children: [
      TextSpan(text: 'Bold ', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: 'normal ', style: TextStyle(color: Colors.grey)),
      TextSpan(text: 'highlight', style: TextStyle(color: Colors.deepPurple)),
    ],
  ),
)

// SelectableText: user can select and copy
SelectableText('You can select this text!')''';
