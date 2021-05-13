import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget/widget_button_common.dart';

class WalkThroughScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppCommonButton(
                    heightButton: 35,
                    textButton: 'Sign In',
                    onPress: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppCommonButton(
                    widthButton: double.infinity,
                    heightButton: 35,
                    borderColor: AppColors.greenColor,
                    backgroundColor: AppColors.black,
                    textColor: AppColors.greenColor,
                    textButton: 'Sign up',
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
