import 'package:flutter/material.dart';
import 'package:zporter_preview/generated/l10n.dart';
import 'package:zporter_preview/presentation/setting/ui/health/widget_health/widget_add_video.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: AddPhotoRow(),
            ),
            AddVideo(
              title: S.of(context).video_num(1),
              onTap: () {},
              videoHeight: 250,
            )
          ],
        ),
      ),
    );
  }
}
