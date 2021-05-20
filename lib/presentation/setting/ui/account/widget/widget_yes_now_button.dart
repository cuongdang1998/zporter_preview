import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_common_button_item.dart';

class YesNoButton extends StatefulWidget {
  final bool isYes;
  final ValueChanged onYesTap;
  final ValueChanged onNoTap;
  final double? buttonHeight;

  const YesNoButton({
    Key? key,
    this.isYes = true,
    required this.onYesTap,
    required this.onNoTap,
    this.buttonHeight,
  }) : super(key: key);

  @override
  _YesNoButtonState createState() => _YesNoButtonState();
}

class _YesNoButtonState extends State<YesNoButton> {
  var _isYes;

  @override
  void initState() {
    _isYes = widget.isYes;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight,
      child: Row(
        children: [
          CommonButtonItem(
            buttonWidth: 50,
            onTap: () {
              if (!_isYes) {
                _isYes = true;
                widget.onYesTap(_isYes);
                setState(() {});
              }
            },
            selectedColor: AppColors.greenColor,
            unSelectedColor: AppColors.black3Color,
            isSelected: _isYes,
            buttonName: 'Yes',
          ),
          SizedBox(
            width: 10,
          ),
          CommonButtonItem(
            buttonWidth: 50,
            onTap: () {
              if (_isYes) {
                _isYes = false;
                widget.onNoTap(_isYes);
                setState(() {});
              }
            },
            selectedColor: AppColors.greenColor,
            unSelectedColor: AppColors.black3Color,
            isSelected: !_isYes,
            buttonName: 'No',
          ),
        ],
      ),
    );
  }
}
