import 'package:flutter/material.dart';
import 'package:zporter_preview/config/language.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_date_picker.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_dropdown.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/widget_common_text_field.dart';
import 'package:zporter_preview/utils/di/injection.dart';
import 'widget_settings/widget_notification_tile.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextField(
              labelText: 'Email',
            ),
            CommonDropDown(
              items: AppLanguage.languages,
              selectedItem: AppLanguage.getSelectedItem(),
              onChange: (lang) {
                getIt<AppLanguage>().changeLanguage(lang);
              },
              labelText: 'Language',
            ),
            NotificationTileWidget(),
            CommonDateTimePicker(
              onSelectedDate: (selectedDate) {
                print("selected date $selectedDate");
              },
              selectedDate: DateTime(1998, 10, 04),
              labelText: "Birthday",
            )
          ],
        ),
      ),
    );
  }
}
