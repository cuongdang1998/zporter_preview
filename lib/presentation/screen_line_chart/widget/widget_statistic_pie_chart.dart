import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/screen_pie_chart/samples/custom_pie_chart_.dart';

import 'widget_pie_chart_note.dart';

class StatisticPieChartWidget extends StatelessWidget {
  const StatisticPieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Last 3m",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "You",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Average",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomPieChart(
                      chartWidth: 50,
                      chartHeight: 50,
                      centerSpaceRadius: 15,
                      outsideRadius: 10,
                      percent: [13, 52, 28, 7, 7],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: pieChartStatisticData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) => PieChartNoteWidget(
                          averagePercentText:
                              pieChartStatisticData[i].averagePercent,
                          youPercentText: pieChartStatisticData[i].youPercent,
                          levelText: pieChartStatisticData[i].level,
                          colorLevelText: pieChartStatisticData[i].colorLevel,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomPieChart(
                      chartWidth: 50,
                      chartHeight: 50,
                      centerSpaceRadius: 15,
                      outsideRadius: 10,
                      percent: [12, 53, 27, 8, 7],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PieChartData {
  final String youPercent;
  final String averagePercent;
  final String level;
  final Color colorLevel;

  PieChartData(
      {required this.youPercent,
      required this.averagePercent,
      required this.level,
      required this.colorLevel});
}

List<PieChartData> pieChartStatisticData = [
  PieChartData(
    youPercent: "13%",
    level: "Very High",
    averagePercent: "12%",
    colorLevel: Colors.blue,
  ),
  PieChartData(
    youPercent: "52%",
    level: "High",
    averagePercent: "53%",
    colorLevel: Colors.green,
  ),
  PieChartData(
    youPercent: "28%",
    level: "Normal",
    averagePercent: "27%",
    colorLevel: Colors.grey,
  ),
  PieChartData(
    youPercent: "7%",
    level: "Low",
    averagePercent: "8%",
    colorLevel: Colors.purpleAccent,
  ),
  PieChartData(
    youPercent: "7%",
    level: "Very Low",
    averagePercent: "7%",
    colorLevel: Colors.red,
  ),
];
