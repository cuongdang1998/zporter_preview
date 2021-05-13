import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

import 'widget_common_button_item.dart';

class FontBackButton extends StatefulWidget {
  final bool? isSelectedFirst;
  final VoidCallback onFontTap;
  final VoidCallback onBackTap;

  const FontBackButton({
    Key? key,
    this.isSelectedFirst = false,
    required this.onFontTap,
    required this.onBackTap,
  }) : super(key: key);

  @override
  _FontBackButtonState createState() => _FontBackButtonState();
}

class _FontBackButtonState extends State<FontBackButton> {
  var _isSelected;

  @override
  void initState() {
    _isSelected = widget.isSelectedFirst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 130,
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonButtonItem(
              onTap: () {
                if (!_isSelected) {
                  widget.onFontTap();
                  _isSelected = true;
                  setState(() {});
                }
              },
              isSelected: _isSelected,
              buttonName: 'Font',
            ),
          ),
          Expanded(
            child: CommonButtonItem(
              onTap: () {
                if (_isSelected) {
                  widget.onBackTap();
                  _isSelected = false;
                  setState(() {});
                }
              },
              isSelected: !_isSelected,
              buttonName: 'Back',
            ),
          ),
        ],
      ),
    );
  }
}
