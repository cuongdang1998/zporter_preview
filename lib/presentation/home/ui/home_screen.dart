import 'package:flutter/material.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/appbars/widget_menu_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/home/bloc/player_dashboard_bloc.dart';
import 'widget/widget_player_dashboard_tabs.dart';
import 'widget/widget_player_dashboard_tab_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayerDashboardBloc>();
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
            child: PlayerDashboardTabs(),
          ),
          Expanded(
            child: BlocConsumer<PlayerDashboardBloc, PlayerDashboardState>(
              listener: (context, state) {
                print("state in pageview $state");
              },
              buildWhen: (pre, cur) {
                if (cur is ScrollIndexState) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return PageView(
                  controller: bloc.pageController,
                  onPageChanged: (index) {
                    bloc.add(ScrollMenuItemEvent(index: index));
                  },
                  children:
                      bloc.menuTabItems.map((tabItem) => tabItem.page).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
