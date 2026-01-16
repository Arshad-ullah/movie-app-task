import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/error/failure.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, UpcomingMoviesEntity>> upcomingMoive();
  Future<Either<Failure, MovieDetailVideoEntity>> getMovieDetail(
    String movieId,
  );

  Future<Either<Failure, MediaEntity>> getMedia(String id);
}
