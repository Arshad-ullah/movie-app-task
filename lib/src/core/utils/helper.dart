import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';

class Helper {
  // to get the url...
  static String? getTrailerUrl(MovieDetailVideoEntity entity) {
    try {
      final trailer = entity.results.firstWhere(
        (e) => e.type == 'Trailer' && e.site == 'YouTube',
      );
      return 'https://www.youtube.com/watch?v=${trailer.key}';
    } catch (_) {
      return null;
    }
  }

  // find genre
  static List<String> mapGenres(List<int> ids) {
    return ids.map((id) => movieGenreMap[id]).whereType<String>().toList();
  }

  // find movie object..
  static MovieEntity? getMovieEntity(List<MovieEntity> movies, int genrId) {
    final movie = movies
        .where((movie) => movie.id == genrId)
        .cast<MovieEntity?>()
        .firstOrNull;
    return movie;
  }
}

const Map<int, String> movieGenreMap = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western",
};
