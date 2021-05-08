part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent {}

class SelectMenuItemEvent extends SettingEvent {
  final int index;

  SelectMenuItemEvent({required this.index});
}

class ScrollMenuItemEvent extends SettingEvent {
  final int index;

  ScrollMenuItemEvent({required this.index});
}