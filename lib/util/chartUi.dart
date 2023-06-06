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
          .orderBy('date', descending: true)
          .limit(8)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<FlSpot> spots = [];

        snapshot.data!.docs.forEach((doc) {
          double weight = doc['weight'].toDouble();
          // Assuming your date field is stored as a String
          String dateString = doc['date'] as String;
          DateTime date = DateFormat('dd/MM/yyyy').parse(dateString);

          spots.add(FlSpot(spots.length.toDouble(), weight));
        });

        return MaterialApp(
          // Remove debug banner
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Color(0xffAE6FF2),
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
      },
    );
  }
}
