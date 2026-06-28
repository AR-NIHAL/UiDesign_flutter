import 'package:flutter/material.dart';

class ShowCodeOverlay extends StatefulWidget {
  final String code;
  final String label;

  const ShowCodeOverlay({
    super.key,
    required this.code,
    this.label = 'Show Code',
  });

  @override
  State<ShowCodeOverlay> createState() => _ShowCodeOverlayState();
}

class _ShowCodeOverlayState extends State<ShowCodeOverlay>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _expanded ? Icons.expand_less : Icons.code,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                _expanded ? 'Hide Code' : widget.label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        if (_expanded)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
              ),
            ),
            child: SelectableText(
              widget.code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                height: 1.6,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[300]
                    : Colors.grey[800],
              ),
            ),
          ),
      ],
    );
  }
}
