import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

BorderRadius _borderRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  topRight: Radius.circular(30),
);

class LayoutPlayerDashboard extends StatelessWidget {
  final Widget topText;
  final List<Widget> contentCard;

  const LayoutPlayerDashboard({
    Key? key,
    required this.topText,
    required this.contentCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 86,
            child: topText,
          ),
          Container(
            color: AppColors.blackColor,
            child: ClipRRect(
              borderRadius: _borderRadius,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.black3Color,
                  borderRadius: _borderRadius,
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contentCard,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
