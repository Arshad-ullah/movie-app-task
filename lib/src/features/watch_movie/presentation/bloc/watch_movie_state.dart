part of 'watch_movie_bloc.dart';

enum Status { initial, loading, success, error }

class WatchMovieState extends Equatable {
  final Status status;
  final String message;
  final UpcomingMoviesEntity? upcomingMoviesEntity;
  const WatchMovieState({
    this.upcomingMoviesEntity,
    this.message = '',

    this.status = Status.initial,
  });

  WatchMovieState copyWith({
    Status? status,
    String? message,
    UpcomingMoviesEntity? upcomingMoviesEntity,
  }) {
    return WatchMovieState(
      status: status ?? this.status,
      message: message ?? this.message,
      upcomingMoviesEntity: upcomingMoviesEntity ?? this.upcomingMoviesEntity,
    );
  }

  WatchMovieState initial() => WatchMovieState();

  @override
  List<Object?> get props => [upcomingMoviesEntity, status, message];
}
