import 'package:flutter/material.dart';
import 'package:zporter_preview/gen/assets.gen.dart';

class BackBodyDisplay extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;

  const BackBodyDisplay({
    Key? key,
    this.imageWidth = 120,
    this.imageHeight = 220,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTapDown: (detail) {
          print('detail ${detail.localPosition}');
        },
        child: Container(
          color: Colors.red,
          width: imageWidth,
          height: imageHeight,
          child: Assets.images.backBody.image(
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
