import 'package:flutter/material.dart';
import 'package:zporter_preview/config/language.dart';

import 'calendar/flutter_calendar_carousel.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime? selectedTime;
  final Function(DateTime, List) onChange;
  final DateTime? maxSelectedDate;
  final DateTime? minSelectedDate;

  const DateTimePicker({
    Key? key,
    this.selectedTime,
    required this.onChange,
    this.maxSelectedDate,
    this.minSelectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel(
      maxSelectedDate: maxSelectedDate,
      minSelectedDate: minSelectedDate,
      selectedDateTime: selectedTime ?? DateTime.now().toUtc(),
      onDayPressed: onChange,
      customDayBuilder: (
        isSelectable,
        index,
        isSelectedDay,
        isToday,
        isPrevMonthDay,
        textStyle,
        isNextMonthDay,
        isThisMonthDay,
        day,
      ) {
        Color textColor = Colors.black;
        if (isPrevMonthDay || isNextMonthDay || !isSelectable) {
          textColor = Colors.grey;
        }
        if (isSelectedDay) {
          textColor = Colors.white;
        }
        return Center(
          child: Text(
            day.day.toString(),
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        );
      },
      selectedDayButtonColor: Colors.orange,
      todayButtonColor: Colors.transparent,
      showOnlyCurrentMonthDate: false,
      width: 300,
      height: 400,
      headerMargin: EdgeInsets.zero,
      locale: AppLanguage.getLanguageCode() ?? "sv",
      headerTextStyle: TextStyle(
        color: Colors.orange,
        fontSize: 18,
      ),
      iconColor: Colors.orange,
      showWeekDays: true,
      weekdayTextStyle: TextStyle(
        color: Colors.orange,
      ),
      childAspectRatio: 1.1,
      headerTitleTouchable: true,
    );
  }
}
