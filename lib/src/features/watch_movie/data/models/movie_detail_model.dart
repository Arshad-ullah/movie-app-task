import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';

class MovieDetailModel {
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
  final List<GenreModel> genres;
  final List<ProductionCompanyModel> productionCompanies;
  final List<String> productionCountries;
  final List<String> spokenLanguages;

  MovieDetailModel({
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

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      runtime: json['runtime'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      homepage: json['homepage'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      genres: (json['genres'] as List? ?? [])
          .map((e) => GenreModel.fromJson(e))
          .toList(),
      productionCompanies: (json['production_companies'] as List? ?? [])
          .map((e) => ProductionCompanyModel.fromJson(e))
          .toList(),
      productionCountries: (json['production_countries'] as List? ?? [])
          .map((e) => e['name'].toString())
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List? ?? [])
          .map((e) => e['english_name'].toString())
          .toList(),
    );
  }

  MovieDetailEntity toEntity() {
    return MovieDetailEntity(
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      adult: adult,
      video: video,
      runtime: runtime,
      originalLanguage: originalLanguage,
      status: status,
      tagline: tagline,
      homepage: homepage,
      popularity: popularity,
      genres: genres.map((e) => e.toEntity()).toList(),
      productionCompanies: productionCompanies
          .map((e) => e.toEntity())
          .toList(),
      productionCountries: productionCountries,
      spokenLanguages: spokenLanguages,
    );
  }
}

class GenreModel {
  final int id;
  final String name;

  GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  GenreEntity toEntity() => GenreEntity(id: id, name: name);
}

class ProductionCompanyModel {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompanyModel({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoPath: json['logo_path'],
      originCountry: json['origin_country'] ?? '',
    );
  }

  ProductionCompanyEntity toEntity() => ProductionCompanyEntity(
    id: id,
    name: name,
    logoPath: logoPath,
    originCountry: originCountry,
  );
}
