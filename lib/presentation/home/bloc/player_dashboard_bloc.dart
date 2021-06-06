import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:zporter_preview/presentation/home/ui/widget/widget_player_dashboard_tab_model.dart';

part 'player_dashboard_event.dart';

part 'player_dashboard_state.dart';

class PlayerDashboardBloc
    extends Bloc<PlayerDashboardEvent, PlayerDashboardState> {
  PlayerDashboardBloc() : super(PlayerDashboardInitial()) {
    selectedItem = menuTabItems.first;
  }

  var menuTabItems = [
    PlayerDashboardMenuItem.TOTAL,
    PlayerDashboardMenuItem.TRAINING,
    PlayerDashboardMenuItem.MATCHES,
    PlayerDashboardMenuItem.ENERGY,
    PlayerDashboardMenuItem.SLEEP,
    PlayerDashboardMenuItem.EAT,
    PlayerDashboardMenuItem.PAIN,
  ];

  PageController pageController = PageController(initialPage: 0);
  final AutoScrollController tabScrollController = AutoScrollController();
  PlayerDashboardMenuItem? selectedItem;

  @override
  Stream<PlayerDashboardState> mapEventToState(
    PlayerDashboardEvent event,
  ) async* {
    if (event is SelectMenuItemEvent) {
      yield* _mapSelectMenuItemToState(event);
    }
    if (event is ScrollMenuItemEvent) {
      yield* _mapScrollMenuItemToState(event);
    }
  }

  Stream<PlayerDashboardState> _mapSelectMenuItemToState(
      SelectMenuItemEvent selectEvent) async* {
    selectPage(selectEvent.index);
    yield SelectIndexState();
  }

  Stream<PlayerDashboardState> _mapScrollMenuItemToState(
      ScrollMenuItemEvent scrollEvent) async* {
    selectedItem = menuTabItems[scrollEvent.index];
    scrollToTab(scrollEvent.index);
    yield ScrollIndexState();
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
