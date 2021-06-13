import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'media_picker_event.dart';
part 'media_picker_state.dart';

class MediaPickerBloc extends Bloc<MediaPickerEvent, MediaPickerState> {
  MediaPickerBloc() : super(MediaPickerInitial());

  @override
  Stream<MediaPickerState> mapEventToState(
    MediaPickerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
