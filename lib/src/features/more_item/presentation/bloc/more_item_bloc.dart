import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'more_item_event.dart';
part 'more_item_state.dart';

class MoreItemBloc extends Bloc<MoreItemEvent, MoreItemState> {
  MoreItemBloc() : super(MoreItemInitial()) {
    on<MoreItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
