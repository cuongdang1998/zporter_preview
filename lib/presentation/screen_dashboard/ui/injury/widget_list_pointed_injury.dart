import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model_injury_type.dart';

class ListPointedInjury extends StatelessWidget {
  final double scaleWidthRate;
  final double scaleHeightRate;

  const ListPointedInjury({
    Key? key,
    required this.scaleWidthRate,
    required this.scaleHeightRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();
    return Stack(
      children: bloc.listPointedInjuries
          .where((injuryModel) => injuryModel.isFront)
          .map(
        (injuryModel) {
          return Positioned(
            left: scaleWidthRate *
                injuryModel.injuryType.originalInjuryParam.injuryPosition.dx,
            top: scaleHeightRate *
                injuryModel.injuryType.originalInjuryParam.injuryPosition.dy,
            child: getInjurySticker(
              injuryModel.injuryLevel,
            ),
          );
        },
      ).toList(),
    );
  }

  Widget getInjurySticker(int injuryLevel) {
    switch (injuryLevel) {
      case 1:
        return Container(
          color: Colors.yellow,
          width: scaleWidthRate * 10,
          height: scaleWidthRate * 20,
        );
      case 2:
        return Container(
          color: Colors.cyan,
          width: scaleWidthRate * 15,
          height: scaleWidthRate * 25,
        );
      case 3:
        return Container(
          color: Colors.orange,
          width: scaleWidthRate * 20,
          height: scaleWidthRate * 30,
        );
      case 4:
        return Container(
          color: Colors.purple,
          width: scaleWidthRate * 25,
          height: scaleWidthRate * 35,
        );
      default:
        return Container();
    }
  }
}