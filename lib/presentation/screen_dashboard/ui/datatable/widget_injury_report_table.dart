import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_custom_data_table.dart';

class InjuryReportTable extends StatefulWidget {
  InjuryReportTable({
    Key? key,
  }) : super(key: key);

  @override
  _InjuryReportTableState createState() => _InjuryReportTableState();
}

class _InjuryReportTableState extends State<InjuryReportTable> {
  final List<String> columnsTitle = [
    'Date',
    'Area',
    'Pain level',
    'Tags',
  ];
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.greyColor,
      ),
      child: Column(
        children: [
          Text(
            'Injury Reports',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 18,
            ),
          ),
          SingleChildScrollView(
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
        ],
      ),
    );
  }

  List<CustomDataRow> buildDataRow() {
    return listInjuryReports.map(
      (injuryReport) {
        return CustomDataRow(
          cells: [
            getDataCell(
                '${injuryReport.date.day}/${injuryReport.date.month}', 0),
            getDataCell('${injuryReport.area}', 1),
            getDataCell('${injuryReport.painLevel}', 2),
            CustomDataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100),
                      child: Text(
                        injuryReport.tags,
                        overflow: TextOverflow.ellipsis,
                        style: getTextStyle(injuryReport.tags, 3),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: AppColors.greyColor,
                  )
                ],
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
                  listInjuryReports.sort(
                    (injuryReportA, injuryReportB) =>
                        injuryReportA.date.compareTo(injuryReportB.date),
                  );
                } else {
                  _isAscending = true;
                  listInjuryReports.sort(
                    (injuryReportA, injuryReportB) =>
                        injuryReportB.date.compareTo(injuryReportA.date),
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
    double fontSize = 14;
    if (columnIndex == 0) {
      color = AppColors.white;
      fontSize = 16;
    } else if (columnIndex == 2) {
      switch (text) {
        case 'Very H':
          color = AppColors.redColor;
          break;
        case 'High':
          color = AppColors.yellowColor;
          break;
        case 'Low':
          color = AppColors.purpleColor;
          break;
        default:
          color = AppColors.greyColor;
          break;
      }
    } else {
      color = AppColors.greyColor;
    }
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }
}

List<DiaryDataModel> listInjuryReports = [
  DiaryDataModel(
    date: DateTime(2021, 5, 30),
    area: 'R-Foot',
    painLevel: 'High',
    tags: 'TagText,TagText',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 29),
    area: 'L-Thigh',
    painLevel: 'High',
    tags: 'Dribbling, Running',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 28),
    area: 'R-Ancle',
    painLevel: 'Low',
    tags: 'Dribbling, Running, Walking',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 27),
    area: 'F-Head',
    painLevel: 'Very H',
    tags: 'Dribbling, Running',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 26),
    area: 'L-Back',
    painLevel: 'Low',
    tags: 'Dribbling, Running',
  ),
  DiaryDataModel(
    date: DateTime(2021, 5, 25),
    area: 'L-Thigh',
    painLevel: 'Very H',
    tags: 'Dribbling, Running',
  ),
];

class DiaryDataModel {
  final DateTime date;
  final String area;
  final String painLevel;
  final String tags;

  DiaryDataModel({
    required this.date,
    required this.area,
    required this.painLevel,
    required this.tags,
  });
}
