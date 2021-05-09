import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/setting/ui/football/widget_football/date_time_picker.dart';

class FootballPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  final DateTime currentTime = DateTime.now().toUtc();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateTimePicker(
          onChange: (selected, event) {
            setState(() {
              selectedDate = selected;
            });
          },
          maxSelectedDate: DateTime(DateTime.now().toUtc().year + 1,
              DateTime.now().toUtc().month, DateTime.now().toUtc().day),
          minSelectedDate: DateTime(DateTime.now().toUtc().year - 1,
              DateTime.now().toUtc().month, DateTime.now().toUtc().day),
          selectedTime: selectedDate,
        ),
      ],
    );
  }
}
