part of 'watch_movie_bloc.dart';

enum Status { initial, loading, success, error }

class WatchMovieState extends Equatable {
  final Status status;
  final String message;
  final int movieId;
  final bool isSeaching;
  final bool isDetailPageLoading;
  final UpcomingMoviesEntity? upcomingMoviesEntity;
  final UpcomingMoviesEntity? upcomingMoviesEntityCopy;
  final MovieDetailVideoEntity? movieDetailVideoEntity;
  final MediaEntity? mediaEntity;

  const WatchMovieState({
    this.upcomingMoviesEntity,
    this.isDetailPageLoading = false,
    this.movieId = 0,
    this.message = '',
    this.movieDetailVideoEntity,
    this.isSeaching = false,
    this.upcomingMoviesEntityCopy,
    this.mediaEntity,
    this.status = Status.initial,
  });

  WatchMovieState copyWith({
    Status? status,
    String? message,
    bool? isSeaching,
    int? movieId,
    bool? isDetailPageLoading,
    MediaEntity? mediaEntity,

    MovieDetailVideoEntity? movieDetailVideoEntity,
    UpcomingMoviesEntity? upcomingMoviesEntity,
    UpcomingMoviesEntity? upcomingMoviesEntityCopy,
  }) {
    return WatchMovieState(
      isSeaching: isSeaching ?? this.isSeaching,
      mediaEntity: mediaEntity ?? this.mediaEntity,
      status: status ?? this.status,
      movieId: movieId ?? this.movieId,
      isDetailPageLoading: isDetailPageLoading ?? this.isDetailPageLoading,
      movieDetailVideoEntity:
          movieDetailVideoEntity ?? this.movieDetailVideoEntity,
      message: message ?? this.message,
      upcomingMoviesEntity: upcomingMoviesEntity ?? this.upcomingMoviesEntity,
      upcomingMoviesEntityCopy:
          upcomingMoviesEntityCopy ?? this.upcomingMoviesEntityCopy,
    );
  }

  WatchMovieState initial() => WatchMovieState();

  @override
  List<Object?> get props => [
    upcomingMoviesEntity,
    status,
    message,
    movieDetailVideoEntity,
    movieId,
    mediaEntity,
    isDetailPageLoading,
    isSeaching,
    upcomingMoviesEntityCopy,
  ];
}
