part of 'player_dashboard_bloc.dart';

@immutable
abstract class PlayerDashboardEvent {}

class SelectMenuItemEvent extends PlayerDashboardEvent {
  final int index;

  SelectMenuItemEvent({required this.index});
}

class ScrollMenuItemEvent extends PlayerDashboardEvent {
  final int index;

  ScrollMenuItemEvent({required this.index});
}
