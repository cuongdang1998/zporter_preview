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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextField(
              labelText: 'Email',
              onChange: (value) {
                print("${validateEmail(value)}");
              },
            ),
            CommonTextField(
              labelText: 'Password',
              isAutoFocus: true,
              isPassword: true,
              onChange: (pass) {
                print('${validatePassword(pass)}');
              },
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

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validatePassword(String pass) {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(pass);

    /// r'^
    ///   (?=.*[A-Z])       // should contain at least one upper case
    ///   (?=.*[a-z])       // should contain at least one lower case
    ///   (?=.*?[0-9])      // should contain at least one digit
    ///   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    ///    .{8,}             // Must be at least 8 characters in length
    /// $
  }
}
