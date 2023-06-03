import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../res/colors.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Introduction Screen Demo',
//       home: progressChart(),
//     );
//   }
// }

class progressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 70), // Target weight loss values
                    FlSpot(1, 68),
                    FlSpot(2, 65),
                    FlSpot(3, 62),
                    FlSpot(4, 60),
                    FlSpot(5, 58),
                    FlSpot(6, 55),
                  ],
                  isCurved: true,
                  color: Color(0xff795EF1),
                  // Target weight loss line color
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
                LineChartBarData(
                  spots: [
                    FlSpot(0, 70), // Current weight loss values
                    FlSpot(1, 69),
                    FlSpot(2, 67),
                    FlSpot(3, 65),
                    FlSpot(4, 64),
                    FlSpot(5, 62),
                    FlSpot(6, 60),
                  ],
                  isCurved: true,
                  color: Color(0xffAE6FF2),
                  // Current weight loss line color
                  barWidth: 3,
                  dotData: FlDotData(show: false),
                ),
              ],
              titlesData: FlTitlesData(show: true),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: true),
              lineTouchData: LineTouchData(enabled: false),
              backgroundColor: AppColors.primaryColor,
            ),
            swapAnimationDuration: Duration(milliseconds: 150),
            swapAnimationCurve: Curves.linear,
          ),
        ),
      ),
    );
  }
}
