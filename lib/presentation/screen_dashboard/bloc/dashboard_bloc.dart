import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zporter_preview/presentation/screen_dashboard/ui/injury/model_injury_type.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  /// key
  GlobalKey frontVisibleKey = GlobalKey();
  GlobalKey frontVisibleTapKey = GlobalKey();

  final List<InjuryType> listDefinedInjuries = [
    InjuryType.FrontLeftHead,
    InjuryType.FrontRightHead,
    InjuryType.FrontLeftUpperArm,
    InjuryType.FrontLeftElbow
  ];

  List<InjuryModel> listPointedInjuries = [];
  int injuryLevel = 1;
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
    final List<InjuryType> mapPointedType = listPointedInjuries
        .map((injuryModel) => injuryModel.injuryType)
        .toList();
    bool isAlreadyPointed = mapPointedType.contains(event.injuryType);
    currentInjuryType = event.injuryType;
    if (isAlreadyPointed) {
      injuryLevel =
          listPointedInjuries[mapPointedType.indexOf(event.injuryType)]
              .injuryLevel;
    } else {
      listPointedInjuries.add(
        InjuryModel(
          injuryType: event.injuryType,
          injuryLevel: injuryLevel,
        ),
      );
    }
    yield PointInjuryState();
  }

  Stream<DashboardState> _mapSetInjuryLevelEventToState(
      SetInjuryLevelEvent event) async* {
    if (currentInjuryType != InjuryType.NoneInjury) {
      var mapPointedType = listPointedInjuries
          .map((injuryModel) => injuryModel.injuryType)
          .toList();
      listPointedInjuries[mapPointedType.indexOf(currentInjuryType)]
          .injuryLevel = event.injuryLevel;
    }
    injuryLevel = event.injuryLevel;
    yield SetInjuryLevelState();
  }

  void resetValue() {
    listPointedInjuries = [];
    currentInjuryType = InjuryType.NoneInjury;
    injuryLevel = 1;
  }
}
