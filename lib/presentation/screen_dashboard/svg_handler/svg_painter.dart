import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:touchable/touchable.dart';
import 'package:zporter_preview/presentation/screen_dashboard/svg_handler/body_path_draw.dart';

class PathPainter extends CustomPainter {
  final BuildContext context;
  final State state;
  final bool front;

  PathPainter(this.context, this.state, this.front);

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    // List<BodyPathDraw> bodyPathList = bodyPathList;

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    // Scale each path to match canvas size
    var xScale = size.width / 250;
    var yScale = size.height / 400;
    final Matrix4 matrix4 = Matrix4.identity();

    matrix4.scale(xScale, yScale);

    bodyPathList.forEach((bodyPart) {
      Path path = parseSvgPath(bodyPart.path);

      paint.color = Colors.red;
      //   if (global.primaryMuscles != null && global.primaryMuscles.contains(bodyPart.primaryName.toLowerCase())) {
      //     paint.color = Colors.blue;
      //   }
      //
      //   if (global.detailedMuscles != null && global.detailedMuscles.contains(bodyPart.detailedName.toLowerCase())) {
      //     paint.color = Colors.blue[900]!;
      //   }
      //
      //   if (global.secondaryMuscles != null && global.secondaryMuscles.contains(bodyPart.primaryName.toLowerCase())) {
      //     paint.color = Colors.blue[200]!;
      //   }
      //
      //   if (global.selectedPrimaryMuscles.contains(bodyPart.primaryName)) {
      //     paint.color = Colors.red;
      //   }
      //
      //   path.transform(matrix4.storage);
      //
        myCanvas.drawPath(
          path.transform(matrix4.storage),
          paint,
          onTapDown: (details) {
            print('details ${details.globalPosition}');
            // state.setState(() {
            //   if (!global.selectedPrimaryMuscles.contains(bodyPart.primaryName)) {
            //     global.selectedPrimaryMuscles.add(bodyPart.primaryName);
            //   } else {
            //     global.selectedPrimaryMuscles.remove(bodyPart.primaryName);
            //   }
            // });
          },
        );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

final List<BodyPathDraw> bodyPathList = [
  BodyPathDraw(
      "Right Fibularis Longus",
      "Legs",
      "Fibularis Longus",
      "Calves",
      Colors.black,
      "m 113.5554,375.08667 c -0.21339,-0.29201 -2.73764,-9.13202 -5.60946,-19.64441 -2.87183,-10.51243 -6.55437,-23.41403 -8.183467,-28.67024 -5.060658,-16.32815 -6.843875,-27.03017 -5.121382,-30.73604 0.783837,-1.6864 3.426194,-1.34663 5.366709,0.69007 4.37395,4.59072 6.80638,16.22272 7.8375,37.479 0.45098,9.29706 1.34125,18.35355 2.07525,21.11107 1.31659,4.9463 5.29811,17.33393 6.1837,19.23918 0.50514,1.08683 -1.7929,1.56588 -2.54885,0.53137 z"
      //"path4126"
      )
];
