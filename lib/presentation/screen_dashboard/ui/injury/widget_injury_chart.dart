import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'widget_back_body_display.dart';
import 'widget_front_body_display.dart';

class InjuryRowChart extends StatelessWidget {
  final bool isFont;
  final List<double> levelPainDatas;

  const InjuryRowChart({
    Key? key,
    required this.isFont,
    required this.levelPainDatas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Stack(
        children: [
          Container(
            child: isFont
                ? FrontBodyDisplay()
                : BackBodyDisplay(),
          ),
          Align(
            alignment: isFont ? Alignment.topRight : Alignment.topLeft,
            child: Column(
              crossAxisAlignment:
                  isFont ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: levelPainDatas.map(
                (painData) {
                  return Container(
                    height: 26,
                    width: painData,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.black26,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
