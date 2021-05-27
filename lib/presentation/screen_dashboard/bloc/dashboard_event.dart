part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class PointInjuryEvent extends DashboardEvent {
  final InjuryType injuryType;

  PointInjuryEvent({required this.injuryType});
}

class SetInjuryLevelEvent extends DashboardEvent {
  final int injuryLevel;

  SetInjuryLevelEvent({required this.injuryLevel});
}
