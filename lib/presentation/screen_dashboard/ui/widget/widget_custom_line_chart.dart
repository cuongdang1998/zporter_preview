import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({
    Key? key,
    required this.youData,
    required this.youColor,
    required this.averageColor,
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
  final Color youColor;
  final Color averageColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientPainter(),
      child: Container(
        width: double.infinity,
        height: 160,
        child: Stack(
          children: [
            Visibility(
              visible: showHorizontalLine,
              child: Positioned(
                top: comparePoint,
                right: 0,
                left: 0,
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.greyColor,
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
                      colors: [youColor],
                      dotData: getDotStyle(
                        color: youColor,
                      ),
                    ),
                    LineChartBarData(
                      spots: averageData,
                      isCurved: false,
                      barWidth: 3,
                      colors: [averageColor],
                      dotData: getDotStyle(
                        color: averageColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlDotData getDotStyle({double radius = 4, required Color color}) {
    return FlDotData(getDotPainter:
        (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
      return FlDotCirclePainter(
        radius: radius,
        color: color,
        strokeColor: color,
      );
    });
  }
}

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..addRect(
        Rect.fromPoints(
          Offset.zero,
          Offset(size.width - 20, size.height),
        ),
      )
      ..fillType = PathFillType.nonZero;
    Paint paint = Paint()
      ..color = AppColors.blueColor.withOpacity(.18)
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(size.width));
    canvas.drawPath(path, paint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
