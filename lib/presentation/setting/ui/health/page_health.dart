import 'package:flutter/material.dart';
import 'widget_health/widget_add_photo_row.dart';

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddPhotoRow(),
          ],
        ),
      ),
    );
  }
}
