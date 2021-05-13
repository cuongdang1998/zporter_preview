import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/walk_through/bloc/walk_through_bloc.dart';
import 'package:zporter_preview/presentation/walk_through/ui/screen_walk_through.dart';

class WalkThroughRoute {
  static Widget get route {
    return BlocProvider(
      create: (context) => WalkThroughBloc(),
      child: WalkThroughScreen(),
    );
  }
}
