import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../res/colors.dart';

class ProgressChart extends StatelessWidget {
  final String userId;

  ProgressChart({required this.userId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('weights')
          .where('userID', isEqualTo: userId)
          .orderBy('date', descending: false)
          .limit(8)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<BarChartGroupData> groupData = [];
        double maxWeight = 0;

        snapshot.data!.docs.skip(1).forEach((doc) {
          double weight = doc['weight'].toDouble();
          if (weight > maxWeight) {
            maxWeight = weight;
          }

          String dateString = doc['date'] as String;
          DateTime date = DateFormat('dd/MM/yyyy').parse(dateString);

          groupData.add(BarChartGroupData(
            x: date.day.toInt(),
            barRods: [
              BarChartRodData(
                toY: weight,
                color: Color(0xffAE6FF2),
                width: 8,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  fromY: 0,
                  toY: maxWeight,
                  color: Color(0xffAE6FF2).withOpacity(0.1),
                ),
              ),
            ],
          ));
        });

        return MaterialApp(
          // Remove debug banner
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: BarChart(
                BarChartData(
                  barGroups: groupData,
                  titlesData: FlTitlesData(
                    show : true,
                  ),

                  gridData: FlGridData(
                    show: true,
                    //show only horizontal lines
                    checkToShowVerticalLine: (value) => false,
                    //show only left titles

                    checkToShowHorizontalLine: (value) => value % 5 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      //gray horizontal lines with opacity 0.1
                      color: Color(0xffAE6FF2).withOpacity(0.3),

                      strokeWidth: 0.5,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
                swapAnimationDuration: Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ),
        );
      },
    );
  }
}
