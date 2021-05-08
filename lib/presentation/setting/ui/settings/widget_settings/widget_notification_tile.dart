import 'package:flutter/material.dart';

import 'widget_notification_button.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notification",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        NotificationButton(
          isSelected: false,
          onTap: () {
            print("Update notification");
          },
        ),
      ],
    );
  }
}
