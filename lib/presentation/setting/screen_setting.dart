import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/setting_bloc.dart';
import 'widget/tab_menu_model.dart';
import 'widget/widget_tab_menu_list.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingBloc>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff262545),
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TabMenuListWidget(
              size: size,
            ),
            Expanded(
              child: BlocConsumer<SettingBloc, SettingState>(
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
                    children: bloc.menuTabItems
                        .map((tabItem) => tabItem.page)
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
