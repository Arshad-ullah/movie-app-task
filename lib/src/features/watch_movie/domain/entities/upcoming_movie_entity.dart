class UpcomingMoviesEntity {
  final DateRangeEntity? dates;
  final int page;
  final List<MovieEntity> movies;
  final int totalPages;
  final int totalResults;

  const UpcomingMoviesEntity({
    required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
}

class DateRangeEntity {
  final String minimum;
  final String maximum;

  const DateRangeEntity({required this.minimum, required this.maximum});
}

class MovieEntity {
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

  const MovieEntity({
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
}
