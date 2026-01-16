import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/usecases/usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_media_usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_usecase.dart';

part 'watch_movie_event.dart';
part 'watch_movie_state.dart';

class WatchMovieBloc extends Bloc<WatchMovieEvent, WatchMovieState> {
  GetMovieUsecase getMovieUsecase;
  GetMediaUsecase getMediaUsecase;
  GetMovieDetailUsecase getMovieDetailUsecase;
  WatchMovieBloc({
    required this.getMovieUsecase,
    required this.getMediaUsecase,

    required this.getMovieDetailUsecase,
  }) : super(WatchMovieState().initial()) {
    on<GetWatchMovieEvent>(_onLoadMovies);
    on<GetWatchMovieDetailEvent>(_onLoadMovieDetail);
    on<GetMediaEvent>(_onLoadMedia);
    on<SearchButtonClickEvent>(_onSearchBtn);
    on<SearchEvent>(_onSearching);
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
          state.copyWith(
            status: Status.success,

            upcomingMoviesEntity: success,

            upcomingMoviesEntityCopy: success,
          ),
        );
      },
    );
  }

  // load movie detail
  FutureOr<void> _onLoadMovieDetail(
    GetWatchMovieDetailEvent event,
    Emitter<WatchMovieState> emit,
  ) async {
    emit(state.copyWith(isDetailPageLoading: true, mediaEntity: null));
    add(GetMediaEvent(movieId: event.movieId));
    final result = await getMovieDetailUsecase(event.movieId);

    result.fold(
      (fail) {
        emit(state.copyWith(isDetailPageLoading: false));
        log("error..${fail.message}");
      },
      (success) {
        emit(
          state.copyWith(
            isDetailPageLoading: false,
            movieId: .parse(event.movieId),
            movieDetailVideoEntity: success,
          ),
        );
      },
    );
  }

  FutureOr<void> _onLoadMedia(
    GetMediaEvent event,
    Emitter<WatchMovieState> emit,
  ) async {
    final result = await getMediaUsecase(event.movieId);

    result.fold(
      (fail) {
        emit(state.copyWith(message: fail.message, status: Status.error));
      },
      (success) {
        emit(state.copyWith(mediaEntity: success));
        print("success..${success.logos.length}");
      },
    );
  }

  // search button click
  FutureOr<void> _onSearchBtn(
    SearchButtonClickEvent event,
    Emitter<WatchMovieState> emit,
  ) {
    emit(
      state.copyWith(
        upcomingMoviesEntity: state.upcomingMoviesEntityCopy,
        isSeaching: !state.isSeaching,
      ),
    );
  }

  // searching movie with title..
  FutureOr<void> _onSearching(
    SearchEvent event,
    Emitter<WatchMovieState> emit,
  ) {
    final original = state.upcomingMoviesEntityCopy;
    if (original == null) return null;

    final query = event.queryText.trim().toLowerCase();

    if (query.isEmpty) {
      emit(state.copyWith(upcomingMoviesEntity: original));
      return null;
    }

    final filteredMovies = original.movies
        .where((movie) => movie.title.toLowerCase().contains(query))
        .toList();

    emit(
      state.copyWith(
        upcomingMoviesEntity: UpcomingMoviesEntity(
          dates: original.dates,
          page: original.page,
          movies: filteredMovies,
          totalPages: original.totalPages,
          totalResults: filteredMovies.length,
        ),
      ),
    );
  }
}
