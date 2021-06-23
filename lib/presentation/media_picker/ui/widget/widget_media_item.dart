import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/gen/assets.gen.dart';
import 'package:zporter_preview/presentation/common/widget/widget_common_checkbox.dart';

import 'lru_map.dart';

// ignore: must_be_immutable
class MediaItemWidget extends StatelessWidget {
  MediaItemWidget({
    Key? key,
    required this.entity,
    required this.option,
    this.checkStatus = false,
    required this.onChange,
  }) : super(key: key);

  final AssetEntity entity;
  final ThumbOption option;
  bool checkStatus;
  final ValueChanged onChange;

  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  Widget buildContent() {
    Widget image;
    if (entity.type == AssetType.audio) {
      return Center(
        child: Icon(
          Icons.audiotrack,
          size: 30,
        ),
      );
    }
    final u8List = ImageLruCache.getData(entity, option.width, ThumbFormat.png);
    if (u8List != null) {
      return _buildImageWidget(entity, u8List, option.width);
    } else {
      image = FutureBuilder<Uint8List?>(
        future: entity.thumbData,
        builder: (context, snapshot) {
          Widget w;
          if (snapshot.data == null) {
            w = loadWidget;
          } else {
            ImageLruCache.setData(
                entity, option.width, ThumbFormat.png, snapshot.data!);
            w = _buildImageWidget(entity, snapshot.data!, option.width);
          }
          return w;
        },
      );
    }
    return image;
  }

  Widget _buildImageWidget(AssetEntity entity, Uint8List uint8list, num size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: [
          Image.memory(
            uint8list,
            width: size.toDouble(),
            height: size.toDouble(),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 3,
            right: 3,
            child: CommonCheckBox(
              borderRadius: 30,
              unselectedColor: AppColors.greyColor,
              tickColor: AppColors.greenColor,
              selectedColor: Colors.transparent,
              checkStatus: checkStatus,
              onChange: onChange,
            ),
          ),
          Visibility(
            visible: entity.type == AssetType.video,
            child: Center(
              child: Assets.images.playCircleIcon.svg(
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final loadWidget = Center(
  child: SizedBox.fromSize(
    size: Size.square(20),
    child: (Platform.isIOS || Platform.isMacOS)
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(
            color: AppColors.greenColor,
            strokeWidth: 1,
          ),
  ),
);
