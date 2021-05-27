import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zporter_preview/presentation/screen_dashboard/ui/injury/model_injury_type.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  // key
  GlobalKey frontVisibleKey = GlobalKey();
  GlobalKey frontVisibleTapKey = GlobalKey();
  int injuryLevel = 1;
  final List<InjuryType> listDefinedInjuries = [
    InjuryType.FrontLeftHead,
    InjuryType.FrontRightHead
  ];
  final List<InjuryModel> listPointedInjuries = [
    InjuryModel(
      isFront: true,
      injuryType: InjuryType.FrontLeftHead,
      injuryLevel: 2,
    ),
  ];
  InjuryType currentInjuryType = InjuryType.NoneInjury;

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is PointInjuryEvent) {
      yield* _mapPointInjuryEventToState(event);
    }
    if (event is SetInjuryLevelEvent) {
      yield* _mapSetInjuryLevelEventToState(event);
    }
  }

  Stream<DashboardState> _mapPointInjuryEventToState(
      PointInjuryEvent event) async* {
    bool isPointed = listPointedInjuries
        .map((injuryModel) => injuryModel.injuryType)
        .toList()
        .contains(event.injuryType);
    if (!isPointed) {
      listPointedInjuries.add(InjuryModel(
        isFront: true,
        injuryType: event.injuryType,
        injuryLevel: injuryLevel,
      ));
      yield PointInjuryState();
    }
    currentInjuryType = event.injuryType;
  }

  Stream<DashboardState> _mapSetInjuryLevelEventToState(
      SetInjuryLevelEvent event) async* {
    if(currentInjuryType != InjuryType.NoneInjury){
    }
    yield SetInjuryLevelState();
  }
}
