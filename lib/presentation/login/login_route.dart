import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/domain/login/repositories/login_repository.dart';
import 'package:zporter_preview/domain/login/usecases/login_usecase.dart';
import 'package:zporter_preview/presentation/login/ui/login_screen.dart';
import 'package:zporter_preview/utils/di/injection.dart';

import 'bloc/login_bloc.dart';

class LoginRoute {
  static Widget get route => BlocProvider(
        create: (context) => LoginBloc(
          LoginUseCase(
            getIt<LoginRepository>(),
          ),
        ),
        child: LoginScreen(),
      );
}
