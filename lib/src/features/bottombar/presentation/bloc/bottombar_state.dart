part of 'bottombar_bloc.dart';

class BottombarState extends Equatable {
  final int currentIndex;
  const BottombarState({this.currentIndex = 1});

  @override
  List<Object> get props => [currentIndex];

  BottombarState copyWith({int? currentIndex}) {
    return BottombarState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
