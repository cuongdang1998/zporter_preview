import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_tab_item.dart';
import 'package:zporter_preview/presentation/home/bloc/player_dashboard_bloc.dart';

import 'widget_player_dashboard_tab_model.dart';

class PlayerDashboardTabs extends StatelessWidget {
  const PlayerDashboardTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayerDashboardBloc>();
    final size = MediaQuery.of(context).size;
    return BlocConsumer<PlayerDashboardBloc, PlayerDashboardState>(
      listener: (context, state) {},
      bloc: bloc,
      buildWhen: (pre, cur) {
        if (cur is SelectIndexState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: bloc.tabScrollController,
            child: Row(
              children: bloc.menuTabItems
                  .map(
                    (tabItem) => AutoScrollTag(
                      key: ValueKey(tabItem.index),
                      controller: bloc.tabScrollController,
                      index: tabItem.index,
                      child: TabItem(
                        size: size,
                        tabText: tabItem.title,
                        isSelected: bloc.selectedItem == tabItem,
                        onTap: () {
                          bloc.add(
                            SelectMenuItemEvent(index: tabItem.index),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
