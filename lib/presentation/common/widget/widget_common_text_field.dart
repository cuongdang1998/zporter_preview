import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';

class CommonTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isAutoFocus;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged? onChange;

  const CommonTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.isAutoFocus = false,
    this.controller,
    this.isPassword = false,
    this.onChange,
  }) : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool isObscureText;

  @override
  void initState() {
    isObscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      height: 55,
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChange,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.fromLTRB(15, 40, widget.isPassword ? 0 : 15, 0),
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.greyColor,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_sharp,
                    color: isObscureText
                        ? AppColors.greyColor
                        : AppColors.blueColor,
                  ),
                )
              : null,
          alignLabelWithHint: true,
        ),
        obscureText: isObscureText,
        cursorColor: Colors.black,
        autofocus: widget.isAutoFocus,
        style: TextStyle(
          fontSize: 16,
          // height: 1
        ),
      ),
    );
  }
}
