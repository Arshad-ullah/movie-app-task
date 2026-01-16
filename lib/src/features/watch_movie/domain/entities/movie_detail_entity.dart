/// Domain Layer: Entities
library;

/// Movie Detail Video Entity
class MovieDetailVideoEntity {
  final int? id;
  final List<MovieVideoEntity> results;

  const MovieDetailVideoEntity({required this.id, required this.results});
}

/// Movie Video Entity
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
