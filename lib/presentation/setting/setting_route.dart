import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/setting/bloc/setting_bloc.dart';
import 'package:zporter_preview/presentation/setting/ui/screen_setting.dart';

class SettingRoute {
  static Widget get route => BlocProvider(
    create: (context) => SettingBloc(),
    child: SettingScreen(),
  );
}
