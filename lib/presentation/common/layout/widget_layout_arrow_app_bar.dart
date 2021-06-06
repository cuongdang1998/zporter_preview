import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/appbars/widget_arrow_appbar.dart';

BorderRadius _borderRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  topRight: Radius.circular(30),
);

class LayoutArrowAppBar extends StatelessWidget {
  final Widget mainWidget;
  final String titleAppBar;

  const LayoutArrowAppBar({
    Key? key,
    required this.mainWidget,
    this.titleAppBar = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          ArrowAppBar(
            title: titleAppBar,
          ),
          Expanded(
            child: Container(
              color: AppColors.blackColor,
              child: ClipRRect(
                borderRadius: _borderRadius,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyCardColor,
                    borderRadius: _borderRadius,
                  ),
                  child: mainWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
