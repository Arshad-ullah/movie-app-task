part of 'select_seat_bloc.dart';

abstract class SelectSeatEvent extends Equatable {
  const SelectSeatEvent();

  @override
  List<Object> get props => [];
}

class DateSelectedEvent extends SelectSeatEvent {
  final int selectedIndex;

  const DateSelectedEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
