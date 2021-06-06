import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/config/colors.dart';
import 'package:zporter_preview/presentation/common/layout/widget_layout_arrow_app_bar.dart';
import 'package:zporter_preview/presentation/login/bloc/sign_up_bloc.dart';

class SignUpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return LayoutArrowAppBar(
      mainWidget: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              color: AppColors.blueColor,
            ),
            Container(
              height: 500,
              color: AppColors.redColor,
            )
          ],
        ),
      ),
      titleAppBar: "Diary Update",
    );
  }
}
