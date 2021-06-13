part of 'media_picker_bloc.dart';

@immutable
abstract class MediaPickerEvent {}

class GetAllMediaResourceEvent extends MediaPickerEvent {}

class SelectOrUnSelectMediaEvent extends MediaPickerEvent {
  final AssetEntity assetEntity;

  SelectOrUnSelectMediaEvent({required this.assetEntity});
}

class SelectAnotherPathEvent extends MediaPickerEvent {
  final int pathIndex;

  SelectAnotherPathEvent({required this.pathIndex});
}

class PlayOrPauseVideoEvent extends MediaPickerEvent {
  final bool isPlaying;

  PlayOrPauseVideoEvent({required this.isPlaying});
}
