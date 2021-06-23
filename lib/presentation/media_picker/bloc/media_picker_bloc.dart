import 'dart:async';
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

part 'media_picker_event.dart';

part 'media_picker_state.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvent, MediaPickerState> {
  MediaPickerBloc() : super(MediaPickerInitial());
  List<AssetEntity> assetEntityList = [];
  List<AssetPathEntity> assetPathList = [];
  List<AssetEntity> selectedAssetList = [];
  late AssetPathEntity path;
  String pathName = '';
  late VideoPlayerController videoController;

  @override
  Stream<MediaPickerState> mapEventToState(
    MediaPickerEvent event,
  ) async* {
    if (event is GetAllMediaResourceEvent) {
      yield* _mapGetAllMediaResourceEventToState();
    }
    if (event is SelectOrUnSelectMediaEvent) {
      yield* _mapSelectOrUnSelectMediaEventToState(event);
    }
    if (event is SelectAnotherPathEvent) {
      yield* _mapSelectAnotherPathEventToState(event);
    }
    if (event is PlayOrPauseVideoEvent) {
      yield* _mapPlayOrPauseEventToState(event);
    }
  }

  /// Stream
  Stream<MediaPickerState> _mapGetAllMediaResourceEventToState() async* {
    await getPathList();
    await getMediaList(0);
    yield GetAllMediaResourceState();
  }

  Stream<MediaPickerState> _mapSelectAnotherPathEventToState(
      SelectAnotherPathEvent event) async* {
    await getPathList();
    await getMediaList(event.pathIndex);
    yield GetAllMediaResourceState();
  }

  Stream<MediaPickerState> _mapSelectOrUnSelectMediaEventToState(
      SelectOrUnSelectMediaEvent event) async* {
    if (selectedAssetList.contains(event.assetEntity)) {
      selectedAssetList.remove(event.assetEntity);
    } else {
      selectedAssetList.add(event.assetEntity);
    }
    yield SelectOrUnSelectMediaState();
  }

  Stream<MediaPickerState> _mapPlayOrPauseEventToState(
      PlayOrPauseVideoEvent event) async* {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    yield PlayOrPauseState();
  }

  /// All methods
  Future<void> getMediaList(int index) async {
    path = assetPathList[index];
    pathName = path.name;
    await path.refreshPathProperties(
      maxDateTimeToNow: true,
    );
    assetEntityList = await path.getAssetListPaged(0, 1000);
    _cacheImage();
  }

  Future<void> getPathList() async {
    assetPathList.clear();
    List<AssetPathEntity> galleryList = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      hasAll: true,
      onlyAll: false,
      filterOption: makeOption(),
    );

    galleryList.sort((s1, s2) {
      return s2.assetCount.compareTo(s1.assetCount);
    });
    this.assetPathList.clear();
    this.assetPathList.addAll(galleryList);
  }

  FilterOptionGroup makeOption() {
    final option = FilterOption(
      sizeConstraint: SizeConstraint(
        minWidth: 0,
        maxWidth: 100000,
        minHeight: 0,
        maxHeight: 100000,
        ignoreSize: true,
      ),
      durationConstraint: DurationConstraint(
        min: Duration.zero,
        max: Duration(hours: 1),
      ),
      needTitle: false,
    );

    final createDtCond = DateTimeCond(
      min: DateTime(2005),
      max: DateTime.now(),
      ignore: false,
    );

    return FilterOptionGroup()
      ..setOption(AssetType.video, option)
      ..setOption(AssetType.image, option)
      ..setOption(AssetType.audio, option)
      ..createTimeCond = createDtCond
      ..containsEmptyAlbum = true
      ..containsPathModified = true
      ..addOrderOption(
        OrderOption(
          type: OrderOptionType.updateDate,
          asc: false,
        ),
      );
  }

  void _cacheImage() {
    path.getAssetListRange(start: 0, end: path.assetCount).then((value) {
      if (value.isEmpty) {
        return;
      }
      PhotoCachingManager().requestCacheAssets(
        assets: value,
        option: ThumbOption(
          width: 130,
          height: 130,
          format: ThumbFormat.png,
        ),
      );
    });
  }

  void resetAllValues() {
    selectedAssetList = [];
    pathName = '';
  }
}
