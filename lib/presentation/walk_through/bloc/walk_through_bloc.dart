import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'walk_through_event.dart';

part 'walk_through_state.dart';

class WalkThroughBloc extends Bloc<WalkThroughEvent, WalkThroughState> {
  WalkThroughBloc() : super(WalkThroughInitial()) {
    currentPageIndex = pageController.initialPage.toInt();
  }

  int currentPageIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Stream<WalkThroughState> mapEventToState(
    WalkThroughEvent event,
  ) async* {
    if (event is ChangePageEvent) {
      if (pageController.page!.toInt() == 0) {
        currentPageIndex = 1;
      } else if (pageController.page!.toInt() == 1) {
        currentPageIndex = 2;
      } else if (pageController.page!.toInt() == 2) {
        currentPageIndex = 0;
      }
      pageController.animateToPage(currentPageIndex,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      yield ChangePageIndexState();
    }
    if (event is ScrollPageEvent) {
      currentPageIndex = event.pageIndex;
      yield ChangePageIndexState();
    }
  }
}
