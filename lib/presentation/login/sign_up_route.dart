import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/domain/login/repositories/login_repository.dart';
import 'package:zporter_preview/domain/login/usecases/login_usecase.dart';
import 'package:zporter_preview/presentation/login/ui/widget/screen_sign_up_verification.dart';
import 'package:zporter_preview/utils/di/injection.dart';

import 'bloc/sign_up_bloc.dart';
import 'ui/sign_up_screen.dart';

class SignUpRoute {
  static Widget get route => BlocProvider(
        create: (context) => SignUpBloc(
          LoginUseCase(
            getIt<LoginRepository>(),
          ),
        ),
        child: SignUpScreen(),
      );

  static Widget signUpVerificationRoute(BuildContext context) =>
      BlocProvider.value(
        value: BlocProvider.of<SignUpBloc>(context),
        child: SignUpVerification(),
      );
}
