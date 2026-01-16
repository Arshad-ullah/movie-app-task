import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';

/// Model for Movie Detail Video
class MovieDetailVideoModel {
  final int? id;
  final List<MovieVideoModel> results;

  MovieDetailVideoModel({this.id, required this.results});

  factory MovieDetailVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailVideoModel(
      id: json['id'],
      results: json['results'] != null
          ? List<MovieVideoModel>.from(
              json['results'].map((x) => MovieVideoModel.fromJson(x)),
            )
          : [],
    );
  }

  /// Convert model to entity if needed
  MovieDetailVideoEntity toEntity() {
    return MovieDetailVideoEntity(
      id: id,
      results: results.map((e) => e.toEntity()).toList(),
    );
  }
}

/// Model for Movie Video
class MovieVideoModel {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  MovieVideoModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'])
          : null,
      id: json['id'],
    );
  }

  /// Convert model to entity if needed
  MovieVideoEntity toEntity() {
    return MovieVideoEntity(
      iso6391: iso6391,
      iso31661: iso31661,
      name: name,
      key: key,
      site: site,
      size: size,
      type: type,
      official: official,
      publishedAt: publishedAt,
      id: id,
    );
  }
}
