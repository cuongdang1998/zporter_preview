import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:zporter_preview/presentation/setting/bloc/setting_bloc.dart';
import 'tab_menu_model.dart';
import 'widget_tab_item.dart';

class TabMenuListWidget extends StatelessWidget {
  final Size size;

  const TabMenuListWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingBloc>();
    return BlocConsumer<SettingBloc, SettingState>(
      listener: (context, state) {
        print("state $state");
      },
      bloc: bloc,
      buildWhen: (pre, cur) {
        if (cur is SelectIndexState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return Container(
          color: Colors.black,
          height: 50,
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
