import 'package:flutter/material.dart';
import 'package:zporter_preview/config/language.dart';
import 'package:zporter_preview/generated/l10n.dart';

// ignore: must_be_immutable
class CommonDateTimePicker extends StatefulWidget {
  DateTime? selectedDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? currentDate;
  final ValueChanged onSelectedDate;

  CommonDateTimePicker({
    Key? key,
    this.selectedDate,
    required this.onSelectedDate,
    this.firstDate,
    this.lastDate,
    this.currentDate,
  }) : super(key: key);

  @override
  _CommonDateTimePickerState createState() => _CommonDateTimePickerState();
}

class _CommonDateTimePickerState extends State<CommonDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await pickDateDialog(widget.selectedDate);
      },
      child: Container(
        height: 55,
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black54,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedDate == null
                  ? '- / - / -'
                  : '${widget.selectedDate!.year}/ ${convertNumber(widget.selectedDate!.month)} / ${convertNumber(widget.selectedDate!.day)}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.calendar_today_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateDialog(DateTime? selectedDate) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now().toUtc(),
      firstDate: widget.firstDate ?? DateTime(1990),
      lastDate: widget.lastDate ?? DateTime(2050),
      currentDate: widget.currentDate ?? DateTime.now().toUtc(),
      cancelText: S.of(context).cancel,
      confirmText: S.of(context).select,
      locale: AppLanguage.getLanguageCodeLocale(),
    );
    if (selected != null) {
      setState(
        () {
          widget.selectedDate = selected;
        },
      );
      widget.onSelectedDate(selected);
    }
  }

  String convertNumber(int number) {
    return number < 10 ? number.toString().padLeft(2, '0') : number.toString();
  }
}
