import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/home/bloc/player_dashboard_bloc.dart';

import 'ui/home_screen.dart';

class HomeRoute {
  static Widget get route => BlocProvider(
        create: (context) => PlayerDashboardBloc(),
        child: HomeScreen(),
      );
}
