import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/config/constants.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:zporter_preview/presentation/screen_dashboard/ui/injury/widget_front_body_display.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_slider.dart';
import 'datatable/widget_diary_datatable.dart';
import 'injury/widget_injury_chart_statistic.dart';
import 'datatable/widget_custom_data_table.dart';
import 'widget/widget_statistic_line_chart.dart';
import 'widget/widget_statistic_pie_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDashboard extends StatefulWidget {
  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  final List<FlSpot> youLineData = [
    FlSpot(0, 0),
    FlSpot(1, 5),
    FlSpot(2, 25),
    FlSpot(3, 30),
    FlSpot(4, 37),
    FlSpot(5, 40),
    FlSpot(6, 30),
  ];

  final List<FlSpot> averageLineData = [
    FlSpot(0, 0),
    FlSpot(1, 15),
    FlSpot(2, 18),
    FlSpot(3, 10),
    FlSpot(4, 6),
    FlSpot(5, 14),
    FlSpot(6, 20),
  ];

  final List<double> youPieDate = [13, 52, 21, 7, 7];

  final List<double> averagePieDate = [12, 23, 20, 31, 14];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 50,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.black3Color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  InjuryChartStatistic(),
                  Container(
                    width: Constants.frontImageWidth,
                    height: Constants.frontImageHeight,
                    child: FrontBodyDisplay(
                      boxKey: bloc.frontVisibleTapKey,
                    ),
                  ),
                  BlocBuilder(
                      bloc: bloc,
                      buildWhen: (pre, cur) {
                        if (cur is PointInjuryState) {
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        print('render slider');
                        return CommonSlider(
                          divisionNum: 3,
                          minValue: 1,
                          maxValue: 4,
                          currentSliderValue: bloc.injuryLevel.toDouble(),
                          onChange: (valueNode) {
                            bloc.add(
                              SetInjuryLevelEvent(
                                injuryLevel: valueNode.toInt(),
                              ),
                            );
                          },
                          levelList: ['Very Low', 'Low', 'High', 'Very High'],
                        );
                      }),
                  StatisticLineChartWidget(
                    averageData: averageLineData,
                    youData: youLineData,
                    lastDaysText: "21 - Last 7 days",
                    topText: "Very High",
                    bottomText: "Very Low",
                  ),
                  StatisticPieChartWidget(
                    youPieData: youPieDate,
                    averagePieData: averagePieDate,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 15),
                    child: DiaryDataTable(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
