import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_app_common_button.dart';
import 'package:zporter_preview/presentation/common/dialog/loading_dialog.dart';
import 'package:zporter_preview/presentation/common/widget/widget_common_text_field.dart';
import 'package:zporter_preview/presentation/login/bloc/login_bloc.dart';
import 'package:zporter_preview/utils/route/app_routing.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginSuccessState:
            LoadingDialog.hideLoadingDialog;
            Navigator.pushNamed(context, RouteDefine.HomeScreen.name);
            break;
          case LoginErrorState:
            print("Login error");
            LoadingDialog.hideLoadingDialog;
            break;
          case LoginLoadingState:
            LoadingDialog.showLoadingDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextField(
                  labelText: 'Email',
                  isAutoFocus: true,
                  controller: bloc.emailController,
                ),
                CommonTextField(
                  labelText: 'Choose Password (+8 signs)',
                  isPassword: true,
                  controller: bloc.passController,
                ),
                CommonTextField(
                  labelText: 'Repeat Password',
                  isPassword: true,
                ),
                AppCommonButton(
                  textButton: 'Sign up',
                  onPress: () {
                    bloc.add(
                      SignUpEvent(
                        bloc.emailController.text.trim(),
                        bloc.passController.text.trim(),
                        bloc.repeatController.text.trim(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
