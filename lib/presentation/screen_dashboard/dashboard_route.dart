import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/screen_dashboard/bloc/dashboard_bloc.dart';

import 'ui/screen_dashboard.dart';

class DashBoardRoute {
  static Widget get route => BlocProvider(
        create: (context) => DashboardBloc(),
        child: ScreenDashboard(),
      );
}
