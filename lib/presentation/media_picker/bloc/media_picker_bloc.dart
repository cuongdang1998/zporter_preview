import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photo_manager/photo_manager.dart';

part 'media_picker_event.dart';

part 'media_picker_state.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvent, MediaPickerState> {
  MediaPickerBloc() : super(MediaPickerInitial());
  List<AssetEntity> assetEntityList = [];
  List<AssetPathEntity> assetPathList = [];
  List<AssetEntity> selectedAssetList = [];
  late final AssetPathEntity path;

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
  }

  Stream<MediaPickerState> _mapGetAllMediaResourceEventToState() async* {
    await refreshGalleryList();
    path = assetPathList[0];
    await path.refreshPathProperties(
      maxDateTimeToNow: true,
    );
    assetEntityList = await path.getAssetListPaged(0, 1000);
    _cacheImage();
    yield GetAllMediaResourceState();
  }

  Stream<MediaPickerState> _mapSelectOrUnSelectMediaEventToState(
      SelectOrUnSelectMediaEvent event) async* {
    List<String> listEntityId = selectedAssetList.map((e) => e.id).toList();
    if (listEntityId.contains(event.assetEntity.id)) {
      selectedAssetList.removeAt(listEntityId.indexOf(event.assetEntity.id));
    } else {
      selectedAssetList.add(event.assetEntity);
    }
    yield SelectOrUnSelectMediaState();
  }

  Future<void> refreshGalleryList() async {
    reset();
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

  void reset() {
    this.assetPathList.clear();
  }

  void _cacheImage() {
    path.getAssetListRange(start: 0, end: path.assetCount).then((value) {
      if (value.isEmpty) {
        return;
      }
      PhotoCachingManager().requestCacheAssets(
        assets: value,
        option: ThumbOption(
          width: 300,
          height: 300,
          format: ThumbFormat.png,
        ),
      );
    });
  }
}
