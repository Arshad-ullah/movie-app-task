import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/error/failure.dart';
import 'package:movie_app/src/core/usecases/usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/repositories/movie_repo.dart';

class GetMovieUsecase implements UseCase<UpcomingMoviesEntity, NoParams> {
  MovieRepo movieRepo;
  GetMovieUsecase(this.movieRepo);
  @override
  Future<Either<Failure, UpcomingMoviesEntity>> call(NoParams params) async {
    return await movieRepo.upcomingMoive();
  }
}
