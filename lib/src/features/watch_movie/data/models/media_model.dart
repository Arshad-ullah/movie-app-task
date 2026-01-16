import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';

class MediaModel {
  final List<MediaItem> logos;
  final List<MediaItem> posters;

  MediaModel({required this.logos, required this.posters});

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      logos: json['logos'] != null
          ? (json['logos'] as List)
                .take(2)
                .map((x) => MediaItem.fromJson(x))
                .toList()
          : [],
      posters: json['posters'] != null
          ? (json['posters'] as List)
                .take(2)
                .map((x) => MediaItem.fromJson(x))
                .toList()
          : [],
    );
  }

  MediaEntity toEntity() {
    return MediaEntity(
      logos: logos.map((item) => item.toEntity()).toList(),
      posters: posters.map((item) => item.toEntity()).toList(),
    );
  }
}

class MediaItem {
  final double aspectRatio;
  final int height;
  final String iso31661;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  MediaItem({
    required this.aspectRatio,
    required this.height,
    required this.iso31661,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      aspectRatio: (json['aspect_ratio'] ?? 0).toDouble(),
      height: json['height'] ?? 0,
      iso31661: json['iso_3166_1'] ?? '',
      iso6391: json['iso_639_1'] ?? '',
      filePath: json['file_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      width: json['width'] ?? 0,
    );
  }

  MediaItemEntity toEntity() {
    return MediaItemEntity(
      aspectRatio: aspectRatio,
      height: height,
      iso31661: iso31661,
      iso6391: iso6391,
      filePath: filePath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      width: width,
    );
  }
}
