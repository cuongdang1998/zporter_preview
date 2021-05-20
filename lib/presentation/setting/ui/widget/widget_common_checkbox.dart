import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class CommonCheckBox extends StatefulWidget {
  final bool checkStatus;
  final ValueChanged onChange;
  final Color tickColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double borderRadius;
  final double width;
  final double height;

  CommonCheckBox({
    Key? key,
    bool? checkStatus,
    required this.onChange,
    Color? tickColor,
    Color? selectedColor,
    Color? unselectedColor,
    double? borderRadius,
    double? width,
    double? height,
  })  : checkStatus = checkStatus ?? false,
        tickColor = tickColor ?? AppColors.whiteColor,
        selectedColor = selectedColor ?? AppColors.greenColor,
        unselectedColor = unselectedColor ?? AppColors.greyColor,
        borderRadius = borderRadius ?? 3,
        width = width ?? 18,
        height = height ?? 18,
        super(key: key);

  @override
  _CommonCheckBoxState createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  late bool _checkStatus;

  @override
  void initState() {
    _checkStatus = widget.checkStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: widget.unselectedColor,
        ),
        child: Checkbox(
          activeColor:
              _checkStatus ? widget.selectedColor : widget.unselectedColor,
          checkColor: widget.tickColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
          ),
          splashRadius: 20,
          value: _checkStatus,
          onChanged: (isChecked) {
            _checkStatus = isChecked!;
            setState(() {});
            widget.onChange(_checkStatus);
          },
        ),
      ),
    );
  }
}
