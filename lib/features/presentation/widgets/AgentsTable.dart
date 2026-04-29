import 'package:flutter/material.dart';

import '../../data/models/models.dart';

class AgentsTable extends StatelessWidget {
  final List<UserFields> fields;

  const AgentsTable({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
        columns: const [
          DataColumn(label: Text('Field Name')),
          DataColumn(label: Text('Crop Type')),
          DataColumn(label: Text('Stage')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Action')),
        ],
        rows: fields.map((field) {
          return DataRow(cells: [
            DataCell(Text(field.field_name)),
            DataCell(Text(field.crop_type)),
            DataCell(Text(field.stage)),


            DataCell(_buildStatusChip(field.stage)),




            DataCell(
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text("View"),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }


  Widget _buildStatusChip(String stage) {
    Color color;

    switch (stage.toLowerCase()) {
      case "growing":
        color = Colors.green;
        break;
      case "ready":
        color = Colors.orange;
        break;
      case "harvested":
        color = Colors.grey;
        break;
      default:
        color = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        stage,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}