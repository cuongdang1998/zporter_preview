part of 'media_picker_bloc.dart';

@immutable
abstract class MediaPickerEvent {}

class GetAllMediaResourceEvent extends MediaPickerEvent {}

class SelectOrUnSelectMediaEvent extends MediaPickerEvent {
  final AssetEntity assetEntity;

  SelectOrUnSelectMediaEvent({required this.assetEntity});
}
