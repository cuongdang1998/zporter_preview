part of 'setting_bloc.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class SelectIndexState extends SettingState {}

class ScrollIndexState extends SettingState {}