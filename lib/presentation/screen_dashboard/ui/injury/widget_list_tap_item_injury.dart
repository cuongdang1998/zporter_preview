import 'package:flutter/material.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model_injury_type.dart';

class ListTapItemInjury extends StatelessWidget {
  const ListTapItemInjury({
    Key? key,
    required this.scaleWidthRate,
    required this.scaleHeightRate,
  }) : super(key: key);
  final double scaleWidthRate;
  final double scaleHeightRate;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();
    return Stack(
      children: bloc.listDefinedInjuries.map(
        (injuryType) {
          return Positioned(
            left: scaleWidthRate *
                injuryType.injuryParam.tapInjuryAreaPosition.dx,
            top: scaleHeightRate *
                injuryType.injuryParam.tapInjuryAreaPosition.dy,
            child: GestureDetector(
              onTap: () {
                print(
                    'tap injury: ${injuryType.injuryParam.injuryName} index:${injuryType.index}');
              },
              child: Container(
                color: injuryType.index == 0 ? Colors.red : Colors.green,
                width:
                    scaleWidthRate * injuryType.injuryParam.tapSizeArea.width,
                height:
                    scaleHeightRate * injuryType.injuryParam.tapSizeArea.height,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
