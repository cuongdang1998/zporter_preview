import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';

class CommonWalkThroughPage extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final AssetGenImage imageWidget;

  const CommonWalkThroughPage({
    Key? key,
    required this.titleText,
    required this.descriptionText,
    required this.imageWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          imageWidget.image(
            width: double.infinity,
            fit: BoxFit.contain,
            height: size.height / 2,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  titleText,
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.greenColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    descriptionText,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
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
