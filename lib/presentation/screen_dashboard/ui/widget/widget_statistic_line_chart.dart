import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'widget_custom_line_chart.dart';
import 'widget_line_chart_note.dart';

class StatisticLineChartWidget extends StatelessWidget {
  final List<FlSpot> youData;
  final List<FlSpot> averageData;
  final String lastDaysText;
  final String topText;
  final String bottomText;

  const StatisticLineChartWidget({
    Key? key,
    required this.youData,
    required this.averageData,
    required this.lastDaysText,
    required this.topText,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      width: double.infinity,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lastDaysText,
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.sort,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              topText,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 18,
              ),
            ),
          ),
          CustomLineChart(
            youData: youData,
            averageData: averageData,
            // showHorizontalLine: false,
            comparePoint: 60,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bottomText,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 18,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NoteLineChart(
                        note: "Average",
                        colorDot: AppColors.greyColor,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      NoteLineChart(
                        note: "You",
                        colorDot: AppColors.blueColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
