import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/setting/account/page_account.dart';
import 'package:zporter_preview/presentation/setting/settings/page_settings.dart';

enum TabMenuItem {
  ACCOUNT,
  SETTINGS,
  HEALTH,
  MEDIA,
  FOOTBALL,
  BIOGRAPHY,
  STRONG
}

extension TabMenuItemExtends on TabMenuItem {
  Widget get page {
    switch (this) {
      case TabMenuItem.ACCOUNT:
        return AccountPage();
      case TabMenuItem.SETTINGS:
        return SettingsPage();
      case TabMenuItem.HEALTH:
        return Container(
          child: Center(
            child: Text(
              TabMenuItem.HEALTH.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      case TabMenuItem.MEDIA:
        return Container(
          child: Center(
            child: Text(
              TabMenuItem.MEDIA.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      case TabMenuItem.FOOTBALL:
        return Container(
          child: Center(
            child: Text(
              TabMenuItem.FOOTBALL.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      case TabMenuItem.BIOGRAPHY:
        return Container(
          child: Center(
            child: Text(
              TabMenuItem.BIOGRAPHY.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      case TabMenuItem.STRONG:
        return Container(
          child: Center(
            child: Text(
              TabMenuItem.STRONG.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      default:
        return Container();
    }
  }

  String get title {
    switch (this) {
      case TabMenuItem.ACCOUNT:
        return 'Account';
      case TabMenuItem.SETTINGS:
        return 'Settings';
      case TabMenuItem.HEALTH:
        return 'Health';
      case TabMenuItem.BIOGRAPHY:
        return 'Biography';
      case TabMenuItem.FOOTBALL:
        return 'Football';
      case TabMenuItem.MEDIA:
        return 'Media';
      case TabMenuItem.STRONG:
        return 'Strong';
      default:
        return '';
    }
  }
}
