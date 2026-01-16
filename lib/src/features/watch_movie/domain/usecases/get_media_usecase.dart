import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/error/failure.dart';
import 'package:movie_app/src/core/usecases/usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/media_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/src/features/watch_movie/domain/repositories/movie_repo.dart';

class GetMediaUsecase implements UseCase<MediaEntity, String> {
  MovieRepo movieRepo;
  GetMediaUsecase(this.movieRepo);
  @override
  Future<Either<Failure, MediaEntity>> call(String movieId) async {
    return await movieRepo.getMedia(movieId);
  }
}
