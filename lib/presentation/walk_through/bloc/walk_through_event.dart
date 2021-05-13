part of 'walk_through_bloc.dart';

@immutable
abstract class WalkThroughEvent {}

class ChangePageEvent extends WalkThroughEvent {
  ChangePageEvent();
}

class ScrollPageEvent extends WalkThroughEvent {
  final int pageIndex;

  ScrollPageEvent({required this.pageIndex});
}
