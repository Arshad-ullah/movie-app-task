part of 'select_seat_bloc.dart';

class SelectSeatState extends Equatable {
  final int selectedDateIndex;

  const SelectSeatState({this.selectedDateIndex = 0});

  SelectSeatState copyWith({int? selectedDateIndex}) {
    return SelectSeatState(
      selectedDateIndex: selectedDateIndex ?? this.selectedDateIndex,
    );
  }

  @override
  List<Object> get props => [selectedDateIndex];
}
