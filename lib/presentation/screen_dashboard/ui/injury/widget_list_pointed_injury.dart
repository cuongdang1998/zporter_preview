import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model_injury_type.dart';

class ListPointedInjury extends StatelessWidget {
  final double scaleWidthRate;
  final double scaleHeightRate;
  final List<InjuryModel> listPointedInjuries;

  const ListPointedInjury({
    Key? key,
    required this.scaleWidthRate,
    required this.scaleHeightRate,
    required this.listPointedInjuries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: listPointedInjuries.map(
        (injuryModel) {
          return getInjurySticker(injuryModel);
        },
      ).toList(),
    );
  }

  Widget getInjurySticker(InjuryModel injuryModel) {
    switch (injuryModel.injuryLevel) {
      case 1:
        return Positioned(
          left: getLeftPosition(
              injuryModel.injuryType, (scaleWidthRate * 20) / 2),
          top: getTopPosition(
              injuryModel.injuryType, (scaleHeightRate * 20) / 2),
          child: ClipOval(
            child: Container(
              color: Colors.yellow,
              width: scaleWidthRate * 20,
              height: scaleHeightRate * 20,
            ),
          ),
        );
      case 2:
        return Positioned(
          left: getLeftPosition(
              injuryModel.injuryType, (scaleWidthRate * 30) / 2),
          top: getTopPosition(
              injuryModel.injuryType, (scaleHeightRate * 30) / 2),
          child: ClipOval(
            child: Container(
              color: Colors.cyan,
              width: scaleWidthRate * 30,
              height: scaleHeightRate * 30,
            ),
          ),
        );
      case 3:
        return Positioned(
          left: getLeftPosition(
              injuryModel.injuryType, (scaleWidthRate * 40) / 2),
          top: getTopPosition(
              injuryModel.injuryType, (scaleHeightRate * 40) / 2),
          child: ClipOval(
            child: Container(
              color: Colors.orange,
              width: scaleWidthRate * 40,
              height: scaleHeightRate * 40,
            ),
          ),
        );
      case 4:
        return Positioned(
          left: getLeftPosition(
              injuryModel.injuryType, (scaleWidthRate * 50) / 2),
          top: getTopPosition(
              injuryModel.injuryType, (scaleHeightRate * 50) / 2),
          child: ClipOval(
            child: Container(
              color: Colors.purple,
              width: scaleWidthRate * 50,
              height: scaleHeightRate * 50,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  double getLeftPosition(InjuryType injuryType, double minus) {
    return scaleWidthRate * injuryType.originalInjuryParam.injuryPosition.dx -
        minus;
  }

  double getTopPosition(InjuryType injuryType, double minus) {
    return scaleWidthRate * injuryType.originalInjuryParam.injuryPosition.dy -
        minus;
  }
}
