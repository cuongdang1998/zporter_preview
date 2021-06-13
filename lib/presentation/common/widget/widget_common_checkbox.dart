import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

// ignore: must_be_immutable
class CommonCheckBox extends StatefulWidget {
  bool checkStatus;
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
        tickColor = tickColor ?? AppColors.greenColor,
        selectedColor = selectedColor ?? AppColors.greenColor,
        unselectedColor = unselectedColor ?? AppColors.greyColor,
        borderRadius = borderRadius ?? 3,
        width = width ?? 20,
        height = height ?? 20,
        super(key: key);

  @override
  _CommonCheckBoxState createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.checkStatus ? widget.tickColor : widget.unselectedColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      width: widget.width,
      height: widget.height,
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.transparent,
        ),
        child: Checkbox(
          activeColor: widget.selectedColor,
          checkColor: widget.tickColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
          ),
          splashRadius: widget.borderRadius,
          value: widget.checkStatus,
          onChanged: (isChecked) {
            widget.checkStatus = isChecked!;
            setState(() {});
            widget.onChange(widget.checkStatus);
          },
        ),
      ),
    );
  }
}
