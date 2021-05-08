import 'package:flutter/material.dart';
import 'package:zporter_preview/config/navigation_util.dart';
import 'package:zporter_preview/generated/l10n.dart';
import 'package:zporter_preview/presentation/setting/ui/account/page_account.dart';
import 'package:zporter_preview/presentation/setting/ui/settings/page_settings.dart';

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
        return S.of(NavigationUtil.currentContext!).account;
      case TabMenuItem.SETTINGS:
        return S.of(NavigationUtil.currentContext!).settings;
      case TabMenuItem.HEALTH:
        return S.of(NavigationUtil.currentContext!).health;
      case TabMenuItem.BIOGRAPHY:
        return S.of(NavigationUtil.currentContext!).biography;
      case TabMenuItem.FOOTBALL:
        return S.of(NavigationUtil.currentContext!).football;
      case TabMenuItem.MEDIA:
        return S.of(NavigationUtil.currentContext!).media;
      case TabMenuItem.STRONG:
        return S.of(NavigationUtil.currentContext!).strong;
      default:
        return '';
    }
  }
}
