import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';

class UpcomingMovieModel {
  final DateRange? dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  UpcomingMovieModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      dates: json['dates'] != null ? DateRange.fromJson(json['dates']) : null,
      page: json['page'] ?? 0,
      results: (json['results'] as List)
          .where((e) => e is Map && e.isNotEmpty)
          .map((e) => Movie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  UpcomingMoviesEntity toEntity() {
    return UpcomingMoviesEntity(
      dates: dates == null
          ? null
          : DateRangeEntity(minimum: dates!.minimum, maximum: dates!.maximum),
      page: page,
      movies: results.map((e) => e.toEntity()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

class DateRange {
  final String minimum;
  final String maximum;

  DateRange({required this.minimum, required this.maximum});

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      minimum: json['minimum'] ?? '',
      maximum: json['maximum'] ?? '',
    );
  }

  DateRangeEntity toEntity() {
    return DateRangeEntity(minimum: minimum, maximum: maximum);
  }
}

class Movie {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final bool video;
  final double popularity;
  final String originalLanguage;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.originalLanguage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      popularity: (json['popularity'] ?? 0).toDouble(),
      originalLanguage: json['original_language'] ?? '',
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      genreIds: genreIds,
      voteAverage: voteAverage,
      voteCount: voteCount,
      adult: adult,
      video: video,
      popularity: popularity,
      originalLanguage: originalLanguage,
    );
  }
}
