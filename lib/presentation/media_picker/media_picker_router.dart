import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zporter_preview/presentation/media_picker/bloc/media_picker_bloc.dart';
import 'ui/media_picker_screen.dart';

class MediaPickerRoute {
  static Widget get route => BlocProvider(
        create: (context) => MediaPickerBloc()..add(GetAllMediaResourceEvent()),
        child: MediaPickerScreen(),
      );
}
