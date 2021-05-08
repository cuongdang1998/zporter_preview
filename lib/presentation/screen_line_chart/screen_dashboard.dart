import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'widget/widget_statistic_line_chart.dart';
import 'widget/widget_statistic_pie_chart.dart';

class ScreenDashboard extends StatelessWidget {
  final List<FlSpot> youData = [
    FlSpot(0, 0),
    FlSpot(1, 5),
    FlSpot(2, 25),
    FlSpot(3, 30),
    FlSpot(4, 37),
    FlSpot(5, 40),
    FlSpot(6, 30),
  ];
  final List<FlSpot> averageData = [
    FlSpot(0, 0),
    FlSpot(1, 15),
    FlSpot(2, 18),
    FlSpot(3, 10),
    FlSpot(4, 6),
    FlSpot(5, 14),
    FlSpot(6, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              height: 50,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  StatisticLineChartWidget(
                    averageData: averageData,
                    youData: youData,
                    lastDaysText: "21 - Last 7 days",
                    topText: "Very High",
                    bottomText: "Very Low",
                  ),
                  StatisticPieChartWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
