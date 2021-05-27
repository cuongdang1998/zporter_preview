import 'package:flutter/material.dart';
import 'package:zporter_preview/gen/assets.gen.dart';

class FrontBodyDisplay extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;

  const FrontBodyDisplay({
    Key? key,
    this.imageWidth = 106,
    this.imageHeight = 220,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      child: Stack(
        children: [
          Assets.images.frontBody.image(fit: BoxFit.fill),
          Positioned(
            left: (imageWidth! / 252) * 110,
            top: (imageHeight! / 526) * 10,
            child: GestureDetector(
              onTap: () {
                print('tap left head');
              },
              child: Container(
                color: Colors.red,
                width: (imageWidth! / 252) * 20,
                height: (imageHeight! / 526) * 22,
              ),
            ),
          ),
          Positioned(
            left: (imageWidth! / 252) * 130,
            top: (imageHeight! / 526) * 10,
            child: GestureDetector(
              onTap: () {
                print('tap right head');
              },
              child: Container(
                color: Colors.green,
                width: (imageWidth! / 252) * 20,
                height: (imageHeight! / 526) * 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
