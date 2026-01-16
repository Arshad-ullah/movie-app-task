import 'package:movie_app/src/features/watch_movie/data/models/movie_detail_model.dart';

class MovieDetailVideoEntity {
  final int? id;
  final List<MovieVideoEntity> results;

  const MovieDetailVideoEntity({required this.id, required this.results});
}

class MovieVideoEntity {
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

  const MovieVideoEntity({
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
}

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
