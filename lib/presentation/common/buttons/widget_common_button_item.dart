import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class CommonButtonItem extends StatelessWidget {
  final String buttonName;
  final bool isSelected;
  final VoidCallback? onTap;
  final double? buttonWidth;
  final Color selectedColor;
  final Color unSelectedColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  final bool isShowBorder;
  final Color borderColor;

  CommonButtonItem({
    Key? key,
    required this.buttonName,
    this.isSelected = false,
    this.onTap,
    this.buttonWidth,
    this.isShowBorder = false,
    Color? selectedColor,
    Color? unSelectedColor,
    Color? selectedTextColor,
    Color? unSelectedTextColor,
    Color? borderColor,
  })  : this.selectedColor = selectedColor ?? AppColors.greenColor,
        this.unSelectedColor = unSelectedColor ?? Colors.transparent,
        this.selectedTextColor = selectedTextColor ?? AppColors.blackColor,
        this.unSelectedTextColor = unSelectedTextColor ?? AppColors.whiteColor,
        this.borderColor = borderColor ?? AppColors.greyColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? selectedColor : unSelectedColor,
          border: Border.all(
            width: 1,
            color:
                !isSelected && isShowBorder ? borderColor : Colors.transparent,
          ),
        ),
        duration: Duration(
          milliseconds: 200,
        ),
        curve: Curves.fastOutSlowIn,
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? selectedTextColor : unSelectedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
