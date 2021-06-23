import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget_media_item.dart';
import 'widget_selected_image.dart';
import 'widget_selected_video.dart';

class LastSelectedMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaPickerBloc bloc = context.read();
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
    print('================================ render ===============');
    return FutureBuilder<File?>(
      future: entity.file,
      builder: (context, snapshot) {
        Widget w = SizedBox();
        if (snapshot.hasError) {
          w = Center(
            child: Text('${snapshot.error}'),
          );
        }
        if (snapshot.hasData) {
          switch (entity.type) {
            case AssetType.video:
              w = LastSelectedVideo(
                videoFile: entity.file,
              );
              break;
            case AssetType.image:
              w = Container(
                width: double.infinity,
                child: InteractiveViewer(
                  panEnabled: false,
                  minScale: 0.1,
                  maxScale: 2,
                  constrained: true,
                  child: LastSelectedImage(
                    imageFile: entity.file,
                  ),
                ),
              );
              break;
            case AssetType.audio:
              w = Center(
                child: Icon(
                  Icons.audiotrack,
                  size: 30,
                ),
              );
              break;
            default:
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
