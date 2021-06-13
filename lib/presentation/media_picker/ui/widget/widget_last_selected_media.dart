import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget_media_item.dart';

class LastSelectedMedia extends StatefulWidget {
  @override
  _LastSelectedMediaState createState() => _LastSelectedMediaState();
}

class _LastSelectedMediaState extends State<LastSelectedMedia> {
  late final MediaPickerBloc bloc;

  @override
  void initState() {
    bloc = context.read();
    super.initState();
  }

  @override
  void dispose() {
    bloc.videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaPickerBloc>();
    if (bloc.selectedAssetList.length <= 0 && bloc.assetEntityList.length > 0) {
      AssetEntity entity = bloc.assetEntityList[0];
      return buildSelectedMedia(entity);
    } else if (bloc.assetEntityList.length <= 0) {
      return SizedBox();
    } else {
      AssetEntity entity =
          bloc.selectedAssetList[bloc.selectedAssetList.length - 1];
      return buildSelectedMedia(entity);
    }
  }

  Widget buildSelectedMedia(AssetEntity entity) {
    return FutureBuilder<File?>(
      future: entity.file,
      builder: (context, snapshot) {
        Widget w;
        if (snapshot.hasError) {
          w = Center(
            child: Text('${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          switch (entity.type) {
            case AssetType.video:
              bloc.videoController = VideoPlayerController.file(snapshot.data!)
                ..setLooping(true)
                ..initialize()
                ..play();
              w = GestureDetector(
                onTap: () {
                  bloc.add(PlayOrPauseVideoEvent(
                      isPlaying: bloc.videoController.value.isPlaying));
                },
                child: Stack(
                  children: [
                    VideoPlayer(bloc.videoController),
                    Visibility(
                      visible: !bloc.videoController.value.isPlaying,
                      child: Center(
                        child: Assets.images.playCircleIcon.svg(),
                      ),
                    )
                  ],
                ),
              );
              break;
            case AssetType.image:
              bloc.videoController.pause();
              w = Container(
                width: double.infinity,
                child: InteractiveViewer(
                  panEnabled: false,
                  minScale: 0.1,
                  maxScale: 2,
                  constrained: true,
                  child: Image.file(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
              break;
            case AssetType.audio:
              bloc.videoController.pause();
              w = Center(
                child: Icon(
                  Icons.audiotrack,
                  size: 30,
                ),
              );
              break;
            default:
              bloc.videoController.pause();
              w = SizedBox();
          }
        } else {
          w = Center(
            child: loadWidget,
          );
        }
        return w;
      },
    );
  }
}
