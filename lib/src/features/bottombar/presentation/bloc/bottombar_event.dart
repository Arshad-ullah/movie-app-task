part of 'bottombar_bloc.dart';

abstract class BottombarEvent extends Equatable {
  const BottombarEvent();

  @override
  List<Object> get props => [];
}

class BottomOnChangedEvent extends BottombarEvent {
  final int index;
  const BottomOnChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}
