import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

class CustomPieChart extends StatelessWidget {
  final double chartWidth;
  final double chartHeight;
  final double centerSpaceRadius;
  final double outsideRadius;
  final List<double> percent;

  const CustomPieChart({
    Key? key,
    required this.chartWidth,
    required this.chartHeight,
    required this.centerSpaceRadius,
    required this.outsideRadius,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: chartWidth,
            height: chartHeight,
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 2,
                centerSpaceRadius: centerSpaceRadius,
                sections: showingSections(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final double fontSize = 6;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: percent[i],
            title: '',
            radius: outsideRadius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: percent[i],
            title: '',
            radius: outsideRadius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.grey,
            value: percent[i],
            title: '',
            radius: outsideRadius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: percent[i],
            title: '',
            radius: outsideRadius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.red,
            value: percent[i],
            title: '',
            radius: outsideRadius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          return PieChartSectionData();
      }
    });
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Indicator(
          color: Color(0xff0293ee),
          text: 'First',
          isSquare: true,
        ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xfff8b250),
          text: 'Second',
          isSquare: true,
        ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xff845bef),
          text: 'Third',
          isSquare: true,
        ),
        SizedBox(
          height: 4,
        ),
        Indicator(
          color: Color(0xff13d38e),
          text: 'Fourth',
          isSquare: true,
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
