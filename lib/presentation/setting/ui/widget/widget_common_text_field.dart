import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool? isAutoFocus;

  const CommonTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.isAutoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28),
      height: 55,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 40, 15, 0),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          alignLabelWithHint: true,
        ),
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: 16,
          height: 1.1,
        ),
      ),
    );
  }
}
