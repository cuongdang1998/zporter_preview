import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'widget_custom_pie_chart_.dart';

class PieChartColumnNote extends StatelessWidget {
  final List<double> pieChartData;
  final List<Color> sectionColors;
  final List<String> noteListText;
  final String pieChartTitle;

  const PieChartColumnNote({
    Key? key,
    required this.pieChartData,
    required this.sectionColors,
    required this.noteListText,
    this.pieChartTitle = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: pieChartTitle.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                pieChartTitle,
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          CustomPieChart(
            chartWidth: 50,
            chartHeight: 50,
            centerSpaceRadius: 17,
            outsideRadius: 8,
            sectionColors: sectionColors,
            zeroPercentColor: AppColors.greyColor,
            noteListText: noteListText,
            pieChartData: pieChartData,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(pieChartData.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${pieChartData[index].toInt()}%',
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(noteListText.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${noteListText[index]}',
                        style: TextStyle(
                          color: sectionColors[index],
                          fontSize: 16,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
