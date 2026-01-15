import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/error/failure.dart';
import 'package:movie_app/src/core/usecases/usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/repositories/movie_repo.dart';

class GetMovieDetailUsecase implements UseCase<MovieDetailEntity, String> {
  MovieRepo movieRepo;
  GetMovieDetailUsecase(this.movieRepo);
  @override
  Future<Either<Failure, MovieDetailEntity>> call(String movieId) async {
    return await movieRepo.getMovieDetail(movieId);
  }
}
