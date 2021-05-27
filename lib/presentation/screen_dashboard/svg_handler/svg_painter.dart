import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:touchable/touchable.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/screen_dashboard/svg_handler/body_path_draw.dart';

class PathPainter extends CustomPainter {
  final BuildContext context;
  final Function(String) onTap;

  PathPainter({
    required this.context,
    required this.onTap,
  });

  @override
  void paint(Canvas _canvas, Size size) {
    TouchyCanvas myCanvas = TouchyCanvas(context, _canvas);
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    bodyPathList.forEach((bodyPart) {
      Path path = parseSvgPathData(bodyPart.path);

      paint.color = bodyPart.color;
      myCanvas.drawPath(
        path,
        paint,
        onTapDown: (details) {
          onTap(
              'index: ${bodyPathList.indexOf(bodyPart)}value from tap${details.localPosition}');
        },
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

final List<BodyPathDraw> bodyPathList = [
  BodyPathDraw(
      "Right Fibularis Longus",
      "Legs",
      "Fibularis Longus",
      "Calves",
      AppColors.greenColor,
      "M83.4225,26.705 C80.4825,26.705 78.155,28.91 78.155,31.9725 C78.155,34.9125 80.4825,37.24 83.4225,37.24 C86.3625,37.24 88.69,35.035 88.69,31.9725 C88.69,28.7875 86.3625,26.705 83.4225,26.705 Z M83.4225,35.035 C81.83,35.035 80.4825,33.6875 80.4825,31.85 C80.4825,30.0125 81.83,28.665 83.4225,28.665 C85.015,28.665 86.3625,29.89 86.3625,31.85 C86.3625,33.6875 85.015,35.035 83.4225,35.035 Z M72.03,26.705 C69.09,26.705 66.7625,28.91 66.7625,31.9725 C66.7625,34.9125 69.09,37.24 72.03,37.24 C74.97,37.24 77.2975,35.035 77.2975,31.9725 C77.2975,28.7875 74.97,26.705 72.03,26.705 Z M72.03,35.035 C70.4375,35.035 69.09,33.6875 69.09,31.85 C69.09,30.0125 70.4375,28.665 72.03,28.665 C73.6225,28.665 74.97,29.89 74.97,31.85 C74.97,33.6875 73.6225,35.035 72.03,35.035 Z M58.4325,28.2975 L58.4325,30.5025 L63.7,30.5025 C63.5775,31.7275 63.0875,32.7075 62.475,33.32 C61.74,34.055 60.515,34.9125 58.4325,34.9125 C55.125,34.9125 52.675,32.34 52.675,29.0325 C52.675,25.725 55.2475,23.1525 58.4325,23.1525 C60.1475,23.1525 61.495,23.8875 62.475,24.745 L64.0675,23.1525 C62.72,21.9275 61.005,20.9475 58.555,20.9475 C54.145,20.9475 50.3475,24.6225 50.3475,29.0325 C50.3475,33.4425 54.145,37.1175 58.555,37.1175 C61.005,37.1175 62.72,36.3825 64.19,34.79 C65.66,33.32 66.15,31.2375 66.15,29.645 C66.15,29.155 66.15,28.665 66.0275,28.2975 L58.4325,28.2975 L58.4325,28.2975 Z M114.0475,30.0125 C113.5575,28.7875 112.3325,26.705 109.6375,26.705 C106.9425,26.705 104.7375,28.7875 104.7375,31.9725 C104.7375,34.9125 106.9425,37.24 109.8825,37.24 C112.21,37.24 113.68,35.77 114.17,34.9125 L112.455,33.6875 C111.8425,34.545 111.1075,35.1575 109.8825,35.1575 C108.6575,35.1575 107.9225,34.6675 107.31,33.565 L114.2925,30.625 L114.0475,30.0125 Z M106.9425,31.7275 C106.9425,29.7675 108.535,28.665 109.6375,28.665 C110.495,28.665 111.3525,29.155 111.5975,29.7675 L106.9425,31.7275 Z M101.185,36.75 L103.5125,36.75 L103.5125,21.4375 L101.185,21.4375 L101.185,36.75 Z M97.51,27.8075 L97.51,27.8075 C96.8975,27.195 95.9175,26.5825 94.6925,26.5825 C92.12,26.5825 89.67,28.91 89.67,31.85 C89.67,34.79 91.9975,36.995 94.6925,36.995 C95.9175,36.995 96.8975,36.3825 97.3875,35.77 L97.51,35.77 L97.51,36.505 C97.51,38.465 96.4075,39.5675 94.6925,39.5675 C93.345,39.5675 92.365,38.5875 92.12,37.73 L90.16,38.5875 C90.7725,39.935 92.2425,41.65 94.815,41.65 C97.51,41.65 99.715,40.0575 99.715,36.26 L99.715,26.95 L97.51,26.95 L97.51,27.8075 L97.51,27.8075 Z M94.815,35.035 C93.2225,35.035 91.875,33.6875 91.875,31.85 C91.875,30.0125 93.2225,28.665 94.815,28.665 C96.4075,28.665 97.6325,30.0125 97.6325,31.85 C97.6325,33.6875 96.4075,35.035 94.815,35.035 Z M124.705,21.4375 L119.1925,21.4375 L119.1925,36.75 L121.52,36.75 L121.52,30.9925 L124.705,30.9925 C127.2775,30.9925 129.7275,29.155 129.7275,26.215 C129.7275,23.275 127.2775,21.4375 124.705,21.4375 Z M124.8275,28.7875 L121.52,28.7875 L121.52,23.52 L124.8275,23.52 C126.5425,23.52 127.5225,24.99 127.5225,26.0925 C127.4,27.44 126.42,28.7875 124.8275,28.7875 Z M138.915,26.5825 C137.2,26.5825 135.485,27.3175 134.8725,28.91 L136.955,29.7675 C137.445,28.91 138.18,28.665 139.0375,28.665 C140.2625,28.665 141.365,29.4 141.4875,30.625 L141.4875,30.7475 C141.12,30.5025 140.14,30.135 139.16,30.135 C136.955,30.135 134.75,31.36 134.75,33.565 C134.75,35.6475 136.5875,36.995 138.5475,36.995 C140.14,36.995 140.875,36.26 141.4875,35.525 L141.61,35.525 L141.61,36.75 L143.815,36.75 L143.815,30.87 C143.57,28.175 141.4875,26.5825 138.915,26.5825 Z M138.67,35.035 C137.935,35.035 136.8325,34.6675 136.8325,33.6875 C136.8325,32.4625 138.18,32.095 139.2825,32.095 C140.2625,32.095 140.7525,32.34 141.365,32.585 C141.12,34.055 139.895,35.035 138.67,35.035 Z M151.5325,26.95 L148.96,33.565 L148.8375,33.565 L146.1425,26.95 L143.6925,26.95 L147.735,36.26 L145.4075,41.405 L147.735,41.405 L153.9825,26.95 L151.5325,26.95 Z M130.9525,36.75 L133.28,36.75 L133.28,21.4375 L130.9525,21.4375 L130.9525,36.75 Z"
    //"path4126"
  ),
  BodyPathDraw(
      "Fibularis Longus",
      "Legs",
      "Fibularis Longus",
      "Calves",
      AppColors.blueColor,
      "M159.25,49 L6.125,49 C2.695,49 0,46.305 0,42.875 L0,6.125 C0,2.695 2.695,0 6.125,0 L159.25,0 C162.68,0 165.375,2.695 165.375,6.125 L165.375,42.875 C165.375,46.1825 162.68,49 159.25,49 Z"
      //"path4126"
      ),
  BodyPathDraw(
      "Right Fibularis Longus",
      "Legs",
      "Fibularis Longus",
      "Calves",
      AppColors.greenColor,
      "M83.4225,26.705 C80.4825,26.705 78.155,28.91 78.155,31.9725 C78.155,34.9125 80.4825,37.24 83.4225,37.24 C86.3625,37.24 88.69,35.035 88.69,31.9725 C88.69,28.7875 86.3625,26.705 83.4225,26.705 Z M83.4225,35.035 C81.83,35.035 80.4825,33.6875 80.4825,31.85 C80.4825,30.0125 81.83,28.665 83.4225,28.665 C85.015,28.665 86.3625,29.89 86.3625,31.85 C86.3625,33.6875 85.015,35.035 83.4225,35.035 Z M72.03,26.705 C69.09,26.705 66.7625,28.91 66.7625,31.9725 C66.7625,34.9125 69.09,37.24 72.03,37.24 C74.97,37.24 77.2975,35.035 77.2975,31.9725 C77.2975,28.7875 74.97,26.705 72.03,26.705 Z M72.03,35.035 C70.4375,35.035 69.09,33.6875 69.09,31.85 C69.09,30.0125 70.4375,28.665 72.03,28.665 C73.6225,28.665 74.97,29.89 74.97,31.85 C74.97,33.6875 73.6225,35.035 72.03,35.035 Z M58.4325,28.2975 L58.4325,30.5025 L63.7,30.5025 C63.5775,31.7275 63.0875,32.7075 62.475,33.32 C61.74,34.055 60.515,34.9125 58.4325,34.9125 C55.125,34.9125 52.675,32.34 52.675,29.0325 C52.675,25.725 55.2475,23.1525 58.4325,23.1525 C60.1475,23.1525 61.495,23.8875 62.475,24.745 L64.0675,23.1525 C62.72,21.9275 61.005,20.9475 58.555,20.9475 C54.145,20.9475 50.3475,24.6225 50.3475,29.0325 C50.3475,33.4425 54.145,37.1175 58.555,37.1175 C61.005,37.1175 62.72,36.3825 64.19,34.79 C65.66,33.32 66.15,31.2375 66.15,29.645 C66.15,29.155 66.15,28.665 66.0275,28.2975 L58.4325,28.2975 L58.4325,28.2975 Z M114.0475,30.0125 C113.5575,28.7875 112.3325,26.705 109.6375,26.705 C106.9425,26.705 104.7375,28.7875 104.7375,31.9725 C104.7375,34.9125 106.9425,37.24 109.8825,37.24 C112.21,37.24 113.68,35.77 114.17,34.9125 L112.455,33.6875 C111.8425,34.545 111.1075,35.1575 109.8825,35.1575 C108.6575,35.1575 107.9225,34.6675 107.31,33.565 L114.2925,30.625 L114.0475,30.0125 Z M106.9425,31.7275 C106.9425,29.7675 108.535,28.665 109.6375,28.665 C110.495,28.665 111.3525,29.155 111.5975,29.7675 L106.9425,31.7275 Z M101.185,36.75 L103.5125,36.75 L103.5125,21.4375 L101.185,21.4375 L101.185,36.75 Z M97.51,27.8075 L97.51,27.8075 C96.8975,27.195 95.9175,26.5825 94.6925,26.5825 C92.12,26.5825 89.67,28.91 89.67,31.85 C89.67,34.79 91.9975,36.995 94.6925,36.995 C95.9175,36.995 96.8975,36.3825 97.3875,35.77 L97.51,35.77 L97.51,36.505 C97.51,38.465 96.4075,39.5675 94.6925,39.5675 C93.345,39.5675 92.365,38.5875 92.12,37.73 L90.16,38.5875 C90.7725,39.935 92.2425,41.65 94.815,41.65 C97.51,41.65 99.715,40.0575 99.715,36.26 L99.715,26.95 L97.51,26.95 L97.51,27.8075 L97.51,27.8075 Z M94.815,35.035 C93.2225,35.035 91.875,33.6875 91.875,31.85 C91.875,30.0125 93.2225,28.665 94.815,28.665 C96.4075,28.665 97.6325,30.0125 97.6325,31.85 C97.6325,33.6875 96.4075,35.035 94.815,35.035 Z M124.705,21.4375 L119.1925,21.4375 L119.1925,36.75 L121.52,36.75 L121.52,30.9925 L124.705,30.9925 C127.2775,30.9925 129.7275,29.155 129.7275,26.215 C129.7275,23.275 127.2775,21.4375 124.705,21.4375 Z M124.8275,28.7875 L121.52,28.7875 L121.52,23.52 L124.8275,23.52 C126.5425,23.52 127.5225,24.99 127.5225,26.0925 C127.4,27.44 126.42,28.7875 124.8275,28.7875 Z M138.915,26.5825 C137.2,26.5825 135.485,27.3175 134.8725,28.91 L136.955,29.7675 C137.445,28.91 138.18,28.665 139.0375,28.665 C140.2625,28.665 141.365,29.4 141.4875,30.625 L141.4875,30.7475 C141.12,30.5025 140.14,30.135 139.16,30.135 C136.955,30.135 134.75,31.36 134.75,33.565 C134.75,35.6475 136.5875,36.995 138.5475,36.995 C140.14,36.995 140.875,36.26 141.4875,35.525 L141.61,35.525 L141.61,36.75 L143.815,36.75 L143.815,30.87 C143.57,28.175 141.4875,26.5825 138.915,26.5825 Z M138.67,35.035 C137.935,35.035 136.8325,34.6675 136.8325,33.6875 C136.8325,32.4625 138.18,32.095 139.2825,32.095 C140.2625,32.095 140.7525,32.34 141.365,32.585 C141.12,34.055 139.895,35.035 138.67,35.035 Z M151.5325,26.95 L148.96,33.565 L148.8375,33.565 L146.1425,26.95 L143.6925,26.95 L147.735,36.26 L145.4075,41.405 L147.735,41.405 L153.9825,26.95 L151.5325,26.95 Z M130.9525,36.75 L133.28,36.75 L133.28,21.4375 L130.9525,21.4375 L130.9525,36.75 Z"
    //"path4126"
  ),
  BodyPathDraw(
      "Right Fibularis Longus",
      "Legs",
      "Fibularis Longus",
      "Calves",
      AppColors.greyColor,
      "M159.25,0.98 C162.0675,0.98 164.395,3.3075 164.395,6.125 L164.395,42.875 C164.395,45.6925 162.0675,48.02 159.25,48.02 L6.125,48.02 C3.3075,48.02 0.98,45.6925 0.98,42.875 L0.98,6.125 C0.98,3.3075 3.3075,0.98 6.125,0.98 L159.25,0.98 M159.25,0 L6.125,0 C2.695,0 0,2.695 0,6.125 L0,42.875 C0,46.305 2.695,49 6.125,49 L159.25,49 C162.68,49 165.375,46.305 165.375,42.875 L165.375,6.125 C165.375,2.8175 162.68,0 159.25,0 L159.25,0 Z"
      //"path4126"
      ),
];