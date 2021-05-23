import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:zporter_preview/presentation/setting/ui/widget/tab_menu_model.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    selectedItem = menuTabItems.first;
  }

  /// Variable for tab bar

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

  /// Variable for get image

  File? faceImage;
  File? fullBodyImage;

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is SelectMenuItemEvent) {
      yield* _mapSelectMenuItemToState(event);
    }
    if (event is ScrollMenuItemEvent) {
      yield* _mapScrollMenuItemToState(event);
    }
    if (event is AddFaceImageEvent) {
      yield* _mapAddFaceImageToState(event);
    }
    if (event is AddFullBodyImageEvent) {
      yield* _mapAddFullBodyImageToState(event);
    }
  }

  /// Handle tab bar and scroll bar

  Stream<SettingState> _mapSelectMenuItemToState(
      SelectMenuItemEvent selectEvent) async* {
    selectPage(selectEvent.index);
    yield SelectIndexState();
  }

  Stream<SettingState> _mapScrollMenuItemToState(
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

  /// Handle get image
  Stream<SettingState> _mapAddFaceImageToState(AddFaceImageEvent event) async* {
    faceImage = event.faceImage;
    yield AddFaceImageState();
  }

  Stream<SettingState> _mapAddFullBodyImageToState(
      AddFullBodyImageEvent event) async* {
    fullBodyImage = event.fullBodyImage;
    yield AddFullBodyImageState();
  }
}
