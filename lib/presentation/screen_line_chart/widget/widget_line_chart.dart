import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.youData,
    required this.averageData,
    bool? showHorizontalLine,
    double? comparePoint,
  })  : showHorizontalLine = showHorizontalLine ?? true,
        comparePoint = comparePoint ?? 0,
        super(key: key);

  final List<FlSpot> youData;
  final List<FlSpot> averageData;
  final bool showHorizontalLine;
  final double comparePoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red, Colors.blueGrey],
              ),
            ),
          ),
          Visibility(
            visible: showHorizontalLine,
            child: Positioned(
              top: comparePoint,
              right: 0,
              left: 0,
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                // handle touch on the point of line chart
                lineTouchData: LineTouchData(
                  enabled: false,
                ),
                // handle visible data on x,y axis
                titlesData: FlTitlesData(
                  show: false,
                ),
                // handle grid view background
                gridData: FlGridData(
                  show: false,
                ),
                // list of line bar
                lineBarsData: [
                  LineChartBarData(
                    spots: youData,
                    isCurved: false,
                    barWidth: 3,
                    colors: [
                      Colors.indigo,
                    ],
                  ),
                  LineChartBarData(
                    spots: averageData,
                    isCurved: false,
                    barWidth: 3,
                    colors: [
                      Colors.grey,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
