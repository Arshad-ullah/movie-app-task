class MediaEntity {
  final List<MediaItemEntity> logos;
  final List<MediaItemEntity> posters;

  MediaEntity({required this.logos, required this.posters});
}

class MediaItemEntity {
  final double aspectRatio;
  final int height;
  final String iso31661;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  MediaItemEntity({
    required this.aspectRatio,
    required this.height,
    required this.iso31661,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });
}
