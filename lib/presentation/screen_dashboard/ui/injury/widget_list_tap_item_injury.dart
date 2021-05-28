import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model_injury_type.dart';

class ListTapItemInjury extends StatelessWidget {
  const ListTapItemInjury({
    Key? key,
    required this.scaleWidthRate,
    required this.scaleHeightRate,
    required this.listDefinedInjuries,
  }) : super(key: key);
  final double scaleWidthRate;
  final double scaleHeightRate;
  final List<InjuryType> listDefinedInjuries;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();
    return Stack(
      children: listDefinedInjuries.map(
        (injuryType) {
          return Positioned(
            left: scaleWidthRate *
                injuryType.originalInjuryParam.tapInjuryAreaPosition.dx,
            top: scaleHeightRate *
                injuryType.originalInjuryParam.tapInjuryAreaPosition.dy,
            child: GestureDetector(
              onTap: () {
                bloc.add(PointInjuryEvent(injuryType: injuryType));
              },
              child: Container(
                color: Colors.transparent,
                width: scaleWidthRate *
                    injuryType.originalInjuryParam.tapSizeArea.width,
                height: scaleHeightRate *
                    injuryType.originalInjuryParam.tapSizeArea.height,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
