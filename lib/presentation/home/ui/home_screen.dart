import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/appbars/widget_menu_app_bar.dart';
import 'package:zporter_preview/presentation/common/layout/widget_layout_player_dashboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          MenuAppBar(
            title: 'Dashboard',
            onSearchTap: () {},
            onNotiTap: () {},
            onTapMenu: () {},
          ),
          SizedBox(
            height: 49,
          ),
          Expanded(
            child: LayoutPlayerDashboard(
              topText: Container(),
              contentCard: [
                Container(
                  height: 500,
                ),
                Container(
                  height: 500,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
