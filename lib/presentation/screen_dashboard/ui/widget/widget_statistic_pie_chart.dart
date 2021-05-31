import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'model_pie_chart_data_note.dart';
import 'widget_custom_pie_chart_.dart';
import 'widget_pie_chart_note.dart';

class StatisticPieChartWidget extends StatelessWidget {
  final List<double> youPieData;
  final List<double> averagePieData;

  const StatisticPieChartWidget({
    Key? key,
    required this.youPieData,
    required this.averagePieData,
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
                      sectionDataList: getSectionDataList(youPieData),
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
                          noteText:
                              '${getSectionDataList(youPieData)[i].sectionNote}',
                          noteTextColor:
                              getSectionDataList(youPieData)[i].colorSection,
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
                      sectionDataList: getSectionDataList(averagePieData),
                      zeroPercentColor: AppColors.yellowColor,
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

  List<PieChartDataNoteModel> getSectionDataList(List<double> percentList) {
    final List<Color> colors = [
      AppColors.blueColor,
      AppColors.greenColor,
      AppColors.greyColor,
      Colors.purpleAccent,
      Colors.red
    ];
    final List<String> sectionNotes = [
      'Very High',
      'High',
      'Normal',
      'Low',
      'Very Low'
    ];
    return List.generate(
      percentList.length,
      (index) {
        return PieChartDataNoteModel(
          colorSection: colors[index],
          percent: percentList[index],
          sectionNote: sectionNotes[index],
        );
      },
    );
  }
}
