import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'model_pie_chart_data_note.dart';

class CustomPieChart extends StatelessWidget {
  final double chartWidth;
  final double chartHeight;
  final double centerSpaceRadius;
  final double outsideRadius;
  final List<double> pieChartData;
  final List<Color> sectionColors;
  final List<String> noteListText;
  final Color zeroPercentColor;
  final bool isMinuteChart;

  const CustomPieChart({
    Key? key,
    required this.chartWidth,
    required this.chartHeight,
    required this.centerSpaceRadius,
    required this.outsideRadius,
    required this.zeroPercentColor,
    required this.pieChartData,
    required this.sectionColors,
    required this.noteListText,
    this.isMinuteChart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  List<PieChartDataNoteModel> getSectionDataList() {
    return List.generate(
      pieChartData.length,
      (index) {
        return PieChartDataNoteModel(
          colorSection: sectionColors[index],
          percent: pieChartData[index],
          sectionNote: noteListText[index],
        );
      },
    );
  }

  List<PieChartSectionData> showingSections() {
    final double fontSize = 6;
    var list = getSectionDataList()
        .where((model) => model.percent != 0)
        .map((section) {
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
    if (!isMinuteChart) {
      double restPercent = 100 -
          getSectionDataList()
              .map((model) => model.percent)
              .toList()
              .fold(0, (p, c) => p + c);
      if (restPercent != 0) {
        list.add(PieChartSectionData(
          color: zeroPercentColor,
          value: restPercent,
          title: '',
          radius: outsideRadius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ));
      }
    }
    return list;
  }
}
