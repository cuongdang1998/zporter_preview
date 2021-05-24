import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget/widget_statistic_line_chart.dart';
import 'widget/widget_statistic_pie_chart.dart';

class ScreenDashboard extends StatelessWidget {
  final List<FlSpot> youLineData = [
    FlSpot(0, 0),
    FlSpot(1, 5),
    FlSpot(2, 25),
    FlSpot(3, 30),
    FlSpot(4, 37),
    FlSpot(5, 40),
    FlSpot(6, 30),
  ];
  final List<FlSpot> averageLineData = [
    FlSpot(0, 0),
    FlSpot(1, 15),
    FlSpot(2, 18),
    FlSpot(3, 10),
    FlSpot(4, 6),
    FlSpot(5, 14),
    FlSpot(6, 20),
  ];

  final List<double> youPieDate = [13, 52, 28, 7, 7];
  final List<double> averagePieDate = [12, 23, 27, 38, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.black2Color,
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
                    averageData: averageLineData,
                    youData: youLineData,
                    lastDaysText: "21 - Last 7 days",
                    topText: "Very High",
                    bottomText: "Very Low",
                  ),
                  StatisticPieChartWidget(
                    youPieData: youPieDate,
                    averagePieData: averagePieDate,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
