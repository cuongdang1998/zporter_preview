import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/layout/widget_layout_player_dashboard.dart';

enum PlayerDashboardMenuItem {
  TOTAL,
  TRAINING,
  MATCHES,
  ENERGY,
  SLEEP,
  EAT,
  PAIN,
}

extension PlayerDashboardMenuItemExtends on PlayerDashboardMenuItem {
  Widget get page {
    switch (this) {
      case PlayerDashboardMenuItem.TOTAL:
        return LayoutPlayerDashboard(
          topText: Text(
            '${this.title}',
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          contentCard: [
            Container(
              height: 500,
            ),
            Container(
              height: 500,
            )
          ],
        );
      case PlayerDashboardMenuItem.TRAINING:
        return Container();
      case PlayerDashboardMenuItem.MATCHES:
        return Container();
      case PlayerDashboardMenuItem.ENERGY:
        return Container();
      case PlayerDashboardMenuItem.SLEEP:
        return Container();
      case PlayerDashboardMenuItem.EAT:
        return Container();
      case PlayerDashboardMenuItem.PAIN:
        return Container();
      default:
        return Container();
    }
  }

  String get title {
    switch (this) {
      case PlayerDashboardMenuItem.TOTAL:
        return 'Total';
      case PlayerDashboardMenuItem.TRAINING:
        return 'Training';
      case PlayerDashboardMenuItem.MATCHES:
        return 'Matches';
      case PlayerDashboardMenuItem.EAT:
        return 'Eat';
      case PlayerDashboardMenuItem.SLEEP:
        return 'Sleep';
      case PlayerDashboardMenuItem.ENERGY:
        return 'Energy';
      case PlayerDashboardMenuItem.PAIN:
        return 'Pain';
      default:
        return '';
    }
  }
}
