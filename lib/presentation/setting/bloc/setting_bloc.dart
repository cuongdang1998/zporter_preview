import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:zporter_preview/presentation/setting/widget/tab_menu_model.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    selectedItem = menuTabItems.first;
  }

  var menuTabItems = [
    TabMenuItem.ACCOUNT,
    TabMenuItem.SETTINGS,
    TabMenuItem.HEALTH,
    TabMenuItem.MEDIA,
    TabMenuItem.FOOTBALL,
    TabMenuItem.BIOGRAPHY,
    TabMenuItem.STRONG,
  ];

  PageController pageController = PageController(initialPage: 0);
  final AutoScrollController tabScrollController = AutoScrollController();
  TabMenuItem? selectedItem;

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SelectMenuItemEvent) {
      selectPage(event.index);
      yield SelectIndexState();
    }
    if (event is ScrollMenuItemEvent) {
      selectedItem = menuTabItems[event.index];
      scrollToTab(event.index);
      yield ScrollIndexState();
    }
  }

  void selectPage(int index) {
    selectedItem = menuTabItems[index];
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void scrollToTab(int index) {
    tabScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
    );
  }
}
