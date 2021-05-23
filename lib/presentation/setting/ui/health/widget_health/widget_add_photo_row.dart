import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/common/app_permission/photo_permission.dart';
import 'package:zporter_preview/presentation/setting/bloc/setting_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget_add_photo.dart';

class AddPhotoRow extends StatelessWidget {
  AddPhotoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingBloc bloc = context.read();
    return BlocBuilder<SettingBloc, SettingState>(
      bloc: bloc,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AddPhoto(
                title: 'Face image',
                onTap: () async {
                  var type = await PhotoPermission.showOptionDialog(context);
                  if (type != null) {
                    await PhotoPermission.checkPermissionAndPickImage(
                      type,
                      context,
                    ).then(
                      (value) {
                        if (value != null) {
                          bloc.add(AddFaceImageEvent(faceImage: value));
                        }
                      },
                    );
                  }
                },
                photo: bloc.faceImage,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: AddPhoto(
                title: 'Full body image',
                onTap: () async {
                  var type = await PhotoPermission.showOptionDialog(context);
                  if (type != null) {
                    await PhotoPermission.checkPermissionAndPickImage(
                      type,
                      context,
                    ).then(
                      (value) {
                        if (value != null) {
                          bloc.add(AddFullBodyImageEvent(fullBodyImage: value));
                        }
                      },
                    );
                  }
                },
                photo: bloc.fullBodyImage,
              ),
            ),
          ],
        );
      },
    );
  }
}
