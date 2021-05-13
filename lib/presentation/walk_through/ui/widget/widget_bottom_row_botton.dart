import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_button_common.dart';

class BottomRowButton extends StatelessWidget {
  const BottomRowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 40,
        right: 20,
        bottom: 30,
      ),
      child: Row(
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
    );
  }
}
