import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';

class MovieDetailVideoModel extends MovieDetailVideoEntity {
  const MovieDetailVideoModel({required super.id, required super.results});

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
}

class MovieVideoModel extends MovieVideoEntity {
  const MovieVideoModel({
    super.iso6391,
    super.iso31661,
    super.name,
    super.key,
    super.site,
    super.size,
    super.type,
    super.official,
    super.publishedAt,
    super.id,
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
}
