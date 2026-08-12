import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VolumeBarChart extends StatelessWidget {
  final List<int> minutes;

  const VolumeBarChart({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: false),
        barGroups: [
          for (int i = 0; i < minutes.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: minutes[i].toDouble(),
                  color: Theme.of(context).colorScheme.primary,
                  width: 14,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
