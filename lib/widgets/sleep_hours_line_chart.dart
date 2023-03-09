import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepHoursLineChart extends StatelessWidget {
  final List<double> sleepHours;

  const SleepHoursLineChart({super.key, required this.sleepHours});

  @override
  Widget build(BuildContext context) {
    double avgSleep = sleepHours.reduce((a, b) => a + b) / 7;
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white.withOpacity(0.8),
        minX: 1,
        maxX: 7,
        minY: 0,
        maxY: 12,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, sleepHours[0]),
              FlSpot(2, sleepHours[1]),
              FlSpot(3, sleepHours[2]),
              FlSpot(4, sleepHours[3]),
              FlSpot(5, sleepHours[4]),
              FlSpot(6, sleepHours[5]),
              FlSpot(7, sleepHours[6]),
            ],
            isCurved: true,
            barWidth: 5,
            color: Colors.green.shade900,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.2),
            ),
            dotData: FlDotData(show: true),
            // You can customize additional properties of the LineChartBarData here
          ),
          LineChartBarData(
            spots: [
              FlSpot(1, avgSleep),
              FlSpot(2, avgSleep),
              FlSpot(3, avgSleep),
              FlSpot(4, avgSleep),
              FlSpot(5, avgSleep),
              FlSpot(6, avgSleep),
              FlSpot(7, avgSleep),
            ],
            color: Colors.red,
            belowBarData: BarAreaData(
              show: false,
              color: Colors.red.withOpacity(0.2),
            ),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                switch (value.toInt()) {
                  case 1:
                    text = 'Mon';
                    break;
                  case 2:
                    text = 'Tue';
                    break;
                  case 3:
                    text = 'Wed';
                    break;
                  case 4:
                    text = 'Thu';
                    break;
                  case 5:
                    text = 'Fri';
                    break;
                  case 6:
                    text = 'Sat';
                    break;
                  case 7:
                    text = 'Sun';
                    break;
                  default:
                    text = '';
                }
                return Text(
                  text,
                  style: const TextStyle(fontSize: 14),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}');
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          checkToShowHorizontalLine: (value) => value % 2 == 0,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.grey.withOpacity(0.2),
            strokeWidth: 1,
          ),
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }
}
