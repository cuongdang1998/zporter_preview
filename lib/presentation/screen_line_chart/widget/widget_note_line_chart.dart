import 'package:flutter/material.dart';

class NoteLineChart extends StatelessWidget {
  const NoteLineChart({
    Key? key,
    required this.note,
    required this.colorDot,
  }) : super(key: key);
  final String note;
  final Color colorDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Container(
              width: 10,
              height: 10,
              color: colorDot,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            note,
            style: TextStyle(
              color: colorDot,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
