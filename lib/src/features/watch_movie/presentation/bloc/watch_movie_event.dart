part of 'watch_movie_bloc.dart';

abstract class WatchMovieEvent extends Equatable {
  const WatchMovieEvent();

  @override
  List<Object> get props => [];
}

class GetWatchMovieEvent extends WatchMovieEvent {}

class GetWatchMovieDetailEvent extends WatchMovieEvent {
  String movieId;

  GetWatchMovieDetailEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}

class GetMediaEvent extends WatchMovieEvent {
  String movieId;

  GetMediaEvent({required this.movieId});
  @override
  List<Object> get props => [movieId];
}

class SearchButtonClickEvent extends WatchMovieEvent {}

class SearchEvent extends WatchMovieEvent {
  String queryText;

  SearchEvent(this.queryText);
  @override
  List<Object> get props => [queryText];
}
