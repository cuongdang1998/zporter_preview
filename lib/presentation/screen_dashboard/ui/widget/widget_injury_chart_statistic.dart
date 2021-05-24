import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_injury_chart.dart';

class InjuryChartStatistic extends StatelessWidget {
  const InjuryChartStatistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      height: 350,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last 90 days',
                  style: TextStyle(color: AppColors.greenColor, fontSize: 16),
                ),
                Icon(
                  Icons.sort,
                  color: AppColors.whiteColor,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InjuryRowChart(
                    isFont: true,
                    levelPainDatas: [10, 21, 10, 50, 31, 15, 3, 5],
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  width: 2,
                ),
                Expanded(
                  child: InjuryRowChart(
                    isFont: false,
                    levelPainDatas: [20, 21, 10, 50, 31, 15, 15, 20],
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
