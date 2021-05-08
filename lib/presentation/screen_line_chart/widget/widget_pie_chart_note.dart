import 'package:flutter/material.dart';

class PieChartNoteWidget extends StatelessWidget {
  const PieChartNoteWidget({
    Key? key,
    required this.youPercentText,
    required this.averagePercentText,
    required this.levelText,
    required this.colorLevelText,
  }) : super(key: key);
  final String youPercentText;
  final String levelText;
  final String averagePercentText;
  final Color colorLevelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            youPercentText,
          ),
          Text(
            levelText,
            style: TextStyle(
              color: colorLevelText,
            ),
          ),
          Text(
            averagePercentText,
          )
        ],
      ),
    );
  }
}
