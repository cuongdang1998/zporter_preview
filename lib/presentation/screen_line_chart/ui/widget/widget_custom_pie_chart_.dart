import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import '../../../screen_pie_chart/samples/indicator.dart';
import 'model_pie_chart_data_note.dart';

class CustomPieChart extends StatelessWidget {
  final double chartWidth;
  final double chartHeight;
  final double centerSpaceRadius;
  final double outsideRadius;
  final List<PieChartDataNoteModel> sectionDataList;

  const CustomPieChart({
    Key? key,
    required this.chartWidth,
    required this.chartHeight,
    required this.centerSpaceRadius,
    required this.outsideRadius,
    required this.sectionDataList,
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
    final double fontSize = 6;
    return sectionDataList.map((section) {
      return PieChartSectionData(
        color: section.colorSection,
        value: section.percent,
        title: '',
        radius: outsideRadius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      );
    }).toList();
  }
}
