import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class TabItem extends StatelessWidget {
  final Size size;
  final bool isSelected;
  final String tabText;
  final VoidCallback onTap;

  const TabItem({
    Key? key,
    required this.size,
    required this.tabText,
    required this.onTap,
    bool? isSelected,
  })  : isSelected = isSelected ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      splashColor: AppColors.yellowColor,
      child: Container(
        width: size.width / 3,
        height: 50,
        child: Stack(
          children: [
            Center(
              child: Text(
                tabText,
                style: TextStyle(
                  color:
                      isSelected ? AppColors.yellowColor : AppColors.greyColor,
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 2,
                color: isSelected ? AppColors.yellowColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
