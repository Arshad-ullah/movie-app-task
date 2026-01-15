import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/usecases/usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_usecase.dart';

part 'watch_movie_event.dart';
part 'watch_movie_state.dart';

class WatchMovieBloc extends Bloc<WatchMovieEvent, WatchMovieState> {
  GetMovieUsecase getMovieUsecase;
  GetMovieDetailUsecase getMovieDetailUsecase;
  WatchMovieBloc({
    required this.getMovieUsecase,

    required this.getMovieDetailUsecase,
  }) : super(WatchMovieState().initial()) {
    on<GetWatchMovieEvent>(_onLoadMovies);
    on<GetWatchMovieDetailEvent>(_onLoadMovieDetail);
  }

  // load all movies..
  FutureOr<void> _onLoadMovies(
    GetWatchMovieEvent event,
    Emitter<WatchMovieState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await getMovieUsecase(NoParams());

    result.fold(
      (fail) {
        emit(state.copyWith(status: Status.error, message: fail.message));
      },
      (success) {
        emit(
          state.copyWith(status: Status.success, upcomingMoviesEntity: success),
        );
      },
    );
  }

  // load movie detail
  FutureOr<void> _onLoadMovieDetail(
    GetWatchMovieDetailEvent event,
    Emitter<WatchMovieState> emit,
  ) async {
    final result = await getMovieDetailUsecase(event.movieId);

    result.fold(
      (fail) {
        print("error..${fail.message}");
      },
      (success) {
        print("success..${success.backdropPath}");
      },
    );
  }
}
