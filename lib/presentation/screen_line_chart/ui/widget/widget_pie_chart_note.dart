import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class PieChartNoteWidget extends StatelessWidget {
  const PieChartNoteWidget({
    Key? key,
    required this.youPercentText,
    required this.averagePercentText,
    required this.noteText,
    required this.noteTextColor,
  }) : super(key: key);
  final String youPercentText;
  final String noteText;
  final String averagePercentText;
  final Color noteTextColor;

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
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
          Text(
            noteText,
            style: TextStyle(
              color: noteTextColor,
              fontSize: 16
            ),
          ),
          Text(
            averagePercentText,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
