import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zporter_preview/config/constants.dart';

class PhotoPermission {
  static var picker = ImagePicker();

  static Future<File?> checkPermissionAndPickImage(
    String type,
    BuildContext context,
  ) async {
    if (type == Constants.TYPE_PERMISSION_GALLERY) {
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
    if (type == Constants.TYPE_PERMISSION_CAMERA) {
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
}
