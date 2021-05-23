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

class AddFaceImageEvent extends SettingEvent {
  final File faceImage;

  AddFaceImageEvent({required this.faceImage});
}

class AddFullBodyImageEvent extends SettingEvent {
  final File fullBodyImage;

  AddFullBodyImageEvent({required this.fullBodyImage});
}
