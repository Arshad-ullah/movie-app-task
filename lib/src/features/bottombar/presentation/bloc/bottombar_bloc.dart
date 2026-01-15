import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottombar_event.dart';
part 'bottombar_state.dart';

class BottombarBloc extends Bloc<BottombarEvent, BottombarState> {
  BottombarBloc() : super(const BottombarState()) {
    on<BottomOnChangedEvent>(_onChangeIndex);
  }

  FutureOr<void> _onChangeIndex(
    BottomOnChangedEvent event,
    Emitter<BottombarState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
