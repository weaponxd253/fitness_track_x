import 'package:fitness_track_x/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityChart extends StatelessWidget {
  final List<Activity> activities;

  ActivityChart({required this.activities});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: _createBarGroups(),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < activities.length) {
                    return Text(activities[index].name);
                  } else {
                    return Text('');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    return activities.asMap().entries.map((entry) {
      int index = entry.key;
      Activity activity = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: activity.value.toDouble(),
            color: Colors.blue,
          ),
        ],
      );
    }).toList();
  }
}
