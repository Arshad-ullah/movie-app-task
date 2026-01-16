import 'package:movie_app/src/features/watch_movie/data/models/media_model.dart';
import 'package:movie_app/src/features/watch_movie/data/models/movie_detail_model.dart';
import 'package:movie_app/src/features/watch_movie/data/models/upcomin_movie_model.dart';

abstract class MovieRemoteDatasource {
  Future<UpcomingMovieModel> upcomingMoive();
  Future<MovieDetailVideoModel> getMovieDetail(String movieId);
  Future<MediaModel> getMedia(String id);
}
