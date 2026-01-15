class MovieDetailEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final bool video;
  final int runtime;
  final String originalLanguage;
  final String status;
  final String tagline;
  final String homepage;
  final double popularity;
  final List<GenreEntity> genres;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<String> productionCountries;
  final List<String> spokenLanguages;

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.runtime,
    required this.originalLanguage,
    required this.status,
    required this.tagline,
    required this.homepage,
    required this.popularity,
    required this.genres,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
  });
}

class GenreEntity {
  final int id;
  final String name;

  GenreEntity({required this.id, required this.name});
}

class ProductionCompanyEntity {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompanyEntity({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}
