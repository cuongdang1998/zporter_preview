import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/walk_through/bloc/walk_through_bloc.dart';

class RowDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WalkThroughBloc _bloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: _bloc,
      buildWhen: (pre, cur) {
        if (cur is ChangePageIndexState || cur is ChangePageIndexState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonDot(
                isSelected: _bloc.currentPageIndex == 0,
              ),
              CommonDot(
                isSelected: _bloc.currentPageIndex == 1,
              ),
              CommonDot(
                isSelected: _bloc.currentPageIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CommonDot extends StatelessWidget {
  final bool isSelected;

  const CommonDot({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.greenColor : AppColors.whiteColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
