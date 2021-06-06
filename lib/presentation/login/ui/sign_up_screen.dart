import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/common/buttons/widget_app_common_button.dart';
import 'package:zporter_preview/presentation/common/widget/widget_common_text_field.dart';
import 'package:zporter_preview/presentation/login/bloc/sign_up_bloc.dart';
import 'package:zporter_preview/utils/route/app_routing.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: bloc,
      listener: (context, state) {
        print('state $state');
        switch (state.runtimeType) {
          case SignUpSuccessState:
            Navigator.pushNamed(
              context,
              RouteDefine.SignUpVerificationScreen.name,
              arguments: context,
            );
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
                      SignUpEmailWithPassEvent(
                        bloc.emailController.text.trim(),
                        bloc.passController.text.trim(),
                        bloc.repeatController.text.trim(),
                      ),
                    );
                  },
                ),
                AppCommonButton(
                  textButton: 'Sign in',
                  onPress: () {
                    bloc.add(
                      SignInEmailWithPassEvent(
                        bloc.emailController.text.trim(),
                        bloc.passController.text.trim(),
                      ),
                    );
                  },
                ),
                AppCommonButton(
                  textButton: 'Next',
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      RouteDefine.SignUpVerificationScreen.name,
                      arguments: context,
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
