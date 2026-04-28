import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../viewmodels/field_viewmodel.dart';

class Piewidget extends StatelessWidget {
  final DashboardViewModel vm;

  const Piewidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    final data = [
      _PieData("Active", vm.active.toDouble(), Colors.blue),
      _PieData("At Risk", vm.atRisk.toDouble(), Colors.orange),
      _PieData("Completed", vm.completed.toDouble(), Colors.purple),
    ];

    return Row(
      children: [
        // 🔵 LEFT SIDE LEGEND (KEY)
        SizedBox(
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      color: e.color,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "${e.label} (${e.value.toInt()})",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(width: 10),

        // 🔵 PIE CHART (SYNCFUSION)
        Expanded(
          child: SfCircularChart(
            legend: const Legend(
              isVisible: false, // we made our own legend
            ),
            tooltipBehavior: TooltipBehavior(enable: true),

            series: <CircularSeries>[
              PieSeries<_PieData, String>(
                dataSource: data,
                xValueMapper: (_PieData d, _) => d.label,
                yValueMapper: (_PieData d, _) => d.value,
                pointColorMapper: (_PieData d, _) => d.color,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside,
                ),
                radius: '80%',
              )
            ],
          ),
        ),
      ],
    );
  }
}

// 🔵 Model for chart
class _PieData {
  final String label;
  final double value;
  final Color color;

  _PieData(this.label, this.value, this.color);
}