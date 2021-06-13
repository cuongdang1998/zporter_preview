part of 'media_picker_bloc.dart';

@immutable
abstract class MediaPickerState {}

class MediaPickerInitial extends MediaPickerState {}

class GetAllMediaResourceState extends MediaPickerState {}

class SelectOrUnSelectMediaState extends MediaPickerState {}
