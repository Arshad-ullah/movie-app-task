import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/error/exception.dart';
import 'package:movie_app/src/core/error/failure.dart';
import 'package:movie_app/src/features/watch_movie/data/datasources/movie_remote_datasource.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/repositories/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDatasource movieRemoteDatasource;

  MovieRepoImpl(this.movieRemoteDatasource);

  @override
  Future<Either<Failure, UpcomingMoviesEntity>> upcomingMoive() async {
    try {
      final model = await movieRemoteDatasource.upcomingMoive();
      final entity = model.toEntity();
      return Right(entity);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Something went wrong. Please try again.'));
    }
  }

  @override
  Future<Either<Failure, MovieDetailVideoEntity>> getMovieDetail(
    String movieId,
  ) async {
    try {
      final model = await movieRemoteDatasource.getMovieDetail(movieId);

      return Right(model.toEntity());
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Something went wrong. Please try again.'));
    }
  }

  @override
  Future<Either<Failure, MediaEntity>> getMedia(String id) async {
    try {
      final model = await movieRemoteDatasource.getMedia(id);

      return Right(model.toEntity());
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Something went wrong. Please try again.'));
    }
  }
}
