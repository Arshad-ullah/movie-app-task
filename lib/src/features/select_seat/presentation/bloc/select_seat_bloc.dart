import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_seat_event.dart';
part 'select_seat_state.dart';

class SelectSeatBloc extends Bloc<SelectSeatEvent, SelectSeatState> {
  SelectSeatBloc() : super(const SelectSeatState()) {
    on<DateSelectedEvent>(_onChangeIndex);
  }

  FutureOr<void> _onChangeIndex(
    DateSelectedEvent event,
    Emitter<SelectSeatState> emit,
  ) {
    emit(state.copyWith(selectedDateIndex: event.selectedIndex));
  }
}
