import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'widget_custom_pie_chart_.dart';
import 'widget_pie_chart_note.dart';

class StatisticPieChartWidget extends StatelessWidget {
  final List<double> youPieData;
  final List<double> averagePieData;
  final List<Color> sectionColors;
  final List<String> textNoteList;

  StatisticPieChartWidget({
    Key? key,
    required this.youPieData,
    required this.averagePieData,
    required this.sectionColors,
    required this.textNoteList,
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
                  fontSize: 18,
                  color: AppColors.greyColor,
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
                      fontSize: 16,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Average",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyColor,
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
                      centerSpaceRadius: 17,
                      outsideRadius: 8,
                      sectionColors: sectionColors,
                      noteListText: textNoteList,
                      pieChartData: youPieData,
                      zeroPercentColor: AppColors.yellowColor,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: youPieData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) => PieChartNoteWidget(
                          averagePercentText: '${averagePieData[i].toInt()}%',
                          youPercentText: '${youPieData[i].toInt()}%',
                          noteText: '${textNoteList[i]}',
                          noteTextColor: sectionColors[i],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomPieChart(
                      chartWidth: 50,
                      chartHeight: 50,
                      centerSpaceRadius: 17,
                      outsideRadius: 8,
                      zeroPercentColor: AppColors.yellowColor,
                      sectionColors: sectionColors,
                      noteListText: textNoteList,
                      pieChartData: averagePieData,
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
