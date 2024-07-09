import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/activity.dart';

class ActivityChart extends StatelessWidget {
  final List<Activity> activities;

  ActivityChart(this.activities);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = activities.map((activity) {
      return BarChartGroupData(
        x: activities.indexOf(activity),
        barRods: [
          BarChartRodData(
            toY: activity.duration.toDouble(),
            color: Colors.blue,
          ),
        ],
      );
    }).toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: barGroups,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                int index = value.toInt();
                if (index < activities.length) {
                  return Text(activities[index].name);
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text('${value.toInt()} min');
              },
            ),
          ),
        ),
      ),
    );
  }
}
