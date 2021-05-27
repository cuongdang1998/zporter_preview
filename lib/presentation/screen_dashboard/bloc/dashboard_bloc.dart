import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zporter_preview/config/constants.dart';
import 'package:zporter_preview/presentation/screen_dashboard/ui/injury/model_injury_type.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  // key
  GlobalKey frontVisibleKey= GlobalKey();
  GlobalKey frontVisibleTapKey= GlobalKey();

  final List<InjuryType> listDefinedInjuries = [
    InjuryType.FrontLeftHead,
    InjuryType.FrontRightHead
  ];

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {}
}
