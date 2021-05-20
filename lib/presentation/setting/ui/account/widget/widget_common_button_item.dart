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

  CommonButtonItem({
    Key? key,
    required this.buttonName,
    this.isSelected = false,
    this.onTap,
    this.buttonWidth,
    Color? selectedColor,
    Color? unSelectedColor,
    Color? selectedTextColor,
    Color? unSelectedTextColor,
  })  : this.selectedColor = selectedColor ?? AppColors.greenColor,
        this.unSelectedColor = unSelectedColor ?? Colors.transparent,
        this.selectedTextColor = selectedTextColor ?? AppColors.blackColor,
        this.unSelectedTextColor = unSelectedTextColor ?? AppColors.whiteColor,
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
