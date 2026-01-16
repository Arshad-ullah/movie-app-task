import 'package:movie_app/src/core/constants/api_endpoints.dart';
import 'package:movie_app/src/core/network/api_client.dart';
import 'package:movie_app/src/features/watch_movie/data/datasources/movie_remote_datasource.dart';
import 'package:movie_app/src/features/watch_movie/data/models/media_model.dart';
import 'package:movie_app/src/features/watch_movie/data/models/movie_detail_model.dart';
import 'package:movie_app/src/features/watch_movie/data/models/upcomin_movie_model.dart';

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  ApiClient apiClient;

  MovieRemoteDatasourceImpl(this.apiClient);
  @override
  Future<UpcomingMovieModel> upcomingMoive() async {
    final json = await apiClient.get(ApiEndpoints.upcomingMovies());
    return UpcomingMovieModel.fromJson(json);
  }

  @override
  Future<MovieDetailVideoModel> getMovieDetail(String movieId) async {
    final json = await apiClient.get(ApiEndpoints.movieDetails(movieId));
    return MovieDetailVideoModel.fromJson(json);
  }

  @override
  Future<MediaModel> getMedia(String id) async {
    final json = await apiClient.get(ApiEndpoints.mediaUrl(id));
    return MediaModel.fromJson(json);
  }
}
