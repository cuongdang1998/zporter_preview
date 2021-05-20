import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

/// Using RawMaterialButton
class AppCommonButton extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final TextStyle textButtonStyle;
  final Color splashColor;
  final String textButton;
  final double? heightButton;
  final double? widthButton;
  final Color? textColor;
  final VoidCallback onPress;

  AppCommonButton({
    Key? key,
    Color? borderColor,
    Color? backgroundColor,
    TextStyle? textButtonStyle,
    Color? splashColor,
    this.widthButton,
    required this.textButton,
    required this.onPress,
    this.heightButton,
    this.textColor,
  })  : borderColor = borderColor ?? AppColors.blueColor,
        backgroundColor = backgroundColor ?? AppColors.blueColor,
        textButtonStyle = textButtonStyle ??
            TextStyle(
              color: textColor ?? AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
        splashColor = splashColor ?? AppColors.whiteColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      width: widthButton,
      child: RawMaterialButton(
        fillColor: backgroundColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
        splashColor: splashColor,
        child: Center(
          child: Text(textButton, style: textButtonStyle),
        ),
        onPressed: onPress,
      ),
    );
  }
}

/// Button button using inkwell
// BorderRadius _buttonBorderRadius = BorderRadius.circular(5);
//
// class AppCommonButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: _buttonBorderRadius,
//         border: Border.all(
//           color: Colors.transparent,
//           width: 2,
//         ),
//         color: AppColors.blueColor,
//       ),
//       child: Material(
//         color: AppColors.blueColor,
//         borderRadius: _buttonBorderRadius,
//         child: InkWell(
//           onTap: () {},
//           splashColor: Colors.transparent,
//
//           borderRadius: _buttonBorderRadius,
//           child: Center(
//             child: Text(
//               "Sign up",
//               style: TextStyle(
//                 color: AppColors.whiteColor,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
