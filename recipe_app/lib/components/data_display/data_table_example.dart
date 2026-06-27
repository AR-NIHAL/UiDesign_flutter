import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('DataTable:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 24,
              headingRowColor: WidgetStateProperty.all(
                Colors.deepPurple.shade50,
              ),
              columns: const [
                DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Age', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Alice')),
                  DataCell(Text('28')),
                  DataCell(Chip(label: Text('Dev'), visualDensity: VisualDensity.compact)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Bob')),
                  DataCell(Text('34')),
                  DataCell(Chip(label: Text('Design'), visualDensity: VisualDensity.compact)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Charlie')),
                  DataCell(Text('25')),
                  DataCell(Chip(label: Text('QA'), visualDensity: VisualDensity.compact)),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Badge:', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Badge(
                label: const Text('3'),
                child: const Icon(Icons.notifications, size: 32),
              ),
              const SizedBox(width: 40),
              Badge(
                isLabelVisible: true,
                smallSize: 8,
                child: const Icon(Icons.home, size: 32),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const dataTableCode = '''// DataTable: displays data in a table format
DataTable(
  columnSpacing: 24,
  headingRowColor: WidgetStateProperty.all(Colors.deepPurple.shade50),
  columns: [
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Age')),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('Alice')),
      DataCell(Text('28')),
    ]),
    DataRow(cells: [
      DataCell(Text('Bob')),
      DataCell(Text('34')),
    ]),
  ],
)

// Badge: notification dot/count on a widget
Badge(
  label: Text('3'),
  child: Icon(Icons.notifications),
)
Badge(isLabelVisible: true, smallSize: 8, child: Icon(Icons.home))''';
