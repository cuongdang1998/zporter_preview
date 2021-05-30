import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_custom_data_table.dart';

class DiaryDataTable extends StatefulWidget {
  DiaryDataTable({
    Key? key,
  }) : super(key: key);

  @override
  _DiaryDataTableState createState() => _DiaryDataTableState();
}

class _DiaryDataTableState extends State<DiaryDataTable> {
  final List<String> columnsTitle = [
    'Date',
    'Energy',
    'Sleep',
    'Eat',
    'Pain',
  ];
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.greyColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CustomDataTable(
          dataRowHeight: 40,
          headingRowHeight: 40,
          dataTextStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14,
          ),
          headingTextStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16,
          ),
          showBottomBorder: true,
          horizontalMargin: 0,
          extraWidth: -30,
          sortColumnIndex: 0,
          sortAscending: _isAscending,
          isShowBorderRowTitle: false,
          columns: buildColumnTitles(),
          rows: buildDataRow(),
        ),
      ),
    );
  }

  List<CustomDataRow> buildDataRow() {
    return listDiaryDatas.map(
      (diaryData) {
        return CustomDataRow(
          cells: [
            getDataCell('${diaryData.date.day}/${diaryData.date.month}', 0),
            getDataCell('${diaryData.energyStatus}', 1),
            getDataCell('${diaryData.sleepStatus}', 2),
            getDataCell('${diaryData.eatStatus}', 3),
            CustomDataCell(
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      diaryData.painStatus,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(diaryData.painStatus, 4),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_sharp,
                      color: AppColors.greyColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ).toList();
  }

  List<CustomDataColumn> buildColumnTitles() {
    return List.generate(
      columnsTitle.length,
      (index) {
        return CustomDataColumn(
          onSort: (columnIndex, ascending) {
            if (columnIndex == 0) {
              setState(() {
                if (_isAscending == true) {
                  _isAscending = false;
                  listDiaryDatas.sort(
                    (diaryA, diaryB) => diaryB.date.compareTo(diaryA.date),
                  );
                } else {
                  _isAscending = true;
                  listDiaryDatas.sort(
                    (diaryA, diaryB) => diaryA.date.compareTo(diaryB.date),
                  );
                }
              });
            }
          },
          label: Text(
            columnsTitle[index],
          ),
        );
      },
    );
  }

  CustomDataCell getDataCell(String text, int columnIndex) {
    return CustomDataCell(
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 100, minWidth: 0),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: getTextStyle(text, columnIndex),
        ),
      ),
    );
  }

  TextStyle getTextStyle(text, columnIndex) {
    Color color;
    if (columnIndex == 1) {
      switch (text) {
        case 'Very H':
          color = AppColors.blueColor;
          break;
        case 'High':
          color = AppColors.greenColor;
          break;
        case 'Low':
          color = Colors.purple;
          break;
        case 'Very L':
          color = Colors.red;
          break;
        default:
          color = AppColors.greyColor;
          break;
      }
    } else if (columnIndex == 2) {
      switch (text) {
        case 'Very G':
          color = AppColors.blueColor;
          break;
        case 'Good':
          color = AppColors.greenColor;
          break;
        case 'Bad':
          color = Colors.purple;
          break;
        case 'Very B':
          color = Colors.red;
          break;
        default:
          color = AppColors.greyColor;
          break;
      }
    } else if (columnIndex == 3) {
      switch (text) {
        case 'Good':
          color = AppColors.greenColor;
          break;
        case 'Bad':
          color = Colors.purple;
          break;
        case 'Very B':
          color = Colors.red;
          break;
        default:
          color = AppColors.greyColor;
          break;
      }
    } else {
      switch (text) {
        case 'No':
          color = AppColors.greenColor;
          break;
        case 'Low':
          color = Colors.purple;
          break;
        case 'High':
          color = AppColors.yellowColor;
          break;
        case 'Very H':
          color = Colors.red;
          break;
        default:
          color = AppColors.greyColor;
          break;
      }
    }
    return TextStyle(
      color: color,
      fontSize: 14,
    );
  }
}

List<DiaryDataModel> listDiaryDatas = [
  DiaryDataModel(
      date: DateTime(2021, 5, 30),
      energyStatus: 'Very H',
      sleepStatus: 'Very G',
      eatStatus: 'Good',
      painStatus: 'No'),
  DiaryDataModel(
      date: DateTime(2021, 5, 29),
      energyStatus: 'High',
      sleepStatus: 'Normal',
      eatStatus: 'Good',
      painStatus: 'No'),
  DiaryDataModel(
      date: DateTime(2021, 5, 28),
      energyStatus: 'Low',
      sleepStatus: 'Good',
      eatStatus: 'Normal',
      painStatus: 'Low'),
  DiaryDataModel(
    date: DateTime(2021, 5, 27),
    energyStatus: 'Very L',
    sleepStatus: 'Bad',
    eatStatus: 'Bad',
    painStatus: 'High',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 26),
    energyStatus: 'Very H',
    sleepStatus: 'Very B',
    eatStatus: 'Very B',
    painStatus: 'Very H',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 25),
    energyStatus: 'High',
    sleepStatus: 'Good',
    eatStatus: 'Good',
    painStatus: 'Very H',
  ),
];

class DiaryDataModel {
  final DateTime date;
  final String energyStatus;
  final String sleepStatus;
  final String eatStatus;
  final String painStatus;

  DiaryDataModel({
    required this.date,
    required this.energyStatus,
    required this.sleepStatus,
    required this.eatStatus,
    required this.painStatus,
  });
}
