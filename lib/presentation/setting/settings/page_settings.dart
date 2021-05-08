import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/setting/widget/widget_common_dropdown.dart';
import 'package:zporter_preview/presentation/setting/widget/widget_common_text_field.dart';
import 'widget_settings/widget_notification_tile.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextField(),
            CommonDropDown(),
            NotificationTileWidget(),
          ],
        ),
      ),
    );
  }
}
