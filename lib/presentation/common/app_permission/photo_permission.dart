import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/config/constants.dart';
import 'package:zporter_preview/presentation/walk_through/ui/widget/widget_button_common.dart';

class PhotoPermission {
  static var picker = ImagePicker();

  static Future<File?> checkPermissionAndPickImage(
    String type,
    BuildContext context,
  ) async {
    if (type == Constants.typePermissionGallery) {
      final Map<Permission, PermissionStatus> request;
      final PermissionStatus permissionStatus;
      if (Platform.isAndroid) {
        request = await [Permission.storage].request();
        permissionStatus = request[Permission.storage]!;
      } else {
        request = await [Permission.photos].request();
        permissionStatus = request[Permission.photos]!;
      }
      if (permissionStatus.isPermanentlyDenied) {
        var openSetting = await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Permission Denied'),
            content: Text('Zporter need permission to continue'),
            actions: <Widget>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context, false),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Open setting'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );
        if (openSetting == true) {
          await openAppSettings();
        }
      } else if (permissionStatus.isRestricted) {
        await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
              title: Text('Error'),
              content: Text('This feature has been denied by OS'),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Ok'),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ]),
        );
      } else if (permissionStatus.isGranted) {
        return await getImage(ImageSource.gallery);
      }
    }
    if (type == Constants.typePermissionCamera) {
      final Map<Permission, PermissionStatus> request =
          await [Permission.camera].request();
      PermissionStatus permissionStatus = request[Permission.camera]!;
      if (permissionStatus.isPermanentlyDenied) {
        var openSetting = await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Permission Denied'),
            content: Text('Zporter need permission to continue'),
            actions: <Widget>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context, false),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Open setting'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        );
        if (openSetting == true) {
          await openAppSettings();
        }
      } else if (permissionStatus.isRestricted) {
        await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
              title: Text('Error'),
              content: Text('This feature has been denied by OS'),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: Text('Ok'),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ]),
        );
      } else if (permissionStatus.isGranted) {
        return await getImage(ImageSource.camera);
      }
    }
  }

  static Future<File?> getImage(ImageSource imageSource) async {
    try {
      final pickedFile =
          await picker.getImage(source: imageSource, imageQuality: 100);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {}
  }

  static Future<String?> showOptionDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      useSafeArea: false,
      barrierDismissible: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.8),
      builder: (_) {
        return Stack(
          children: [
            Positioned(
              left: 15,
              right: 40,
              bottom: 40,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.black1Color,
                ),
                child: Column(
                  children: <Widget>[
                    AppCommonButton(
                      heightButton: 36,
                      textButton: 'Gallery',
                      onPress: () {
                        Navigator.pop(
                            context, Constants.typePermissionGallery);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppCommonButton(
                      heightButton: 36,
                      textButton: 'Camera',
                      borderColor: AppColors.greenColor,
                      backgroundColor: AppColors.greenColor,
                      splashColor: AppColors.greenColor,
                      onPress: () {
                        Navigator.pop(
                            context, Constants.typePermissionCamera);
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 17,
              right: 17,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Container(
                    color: AppColors.black1Color,
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
