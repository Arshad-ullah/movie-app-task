import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/src/core/network/api_client.dart';
import 'package:movie_app/src/core/network/api_client_impl.dart';
import 'package:movie_app/src/core/network/handler/error_handler.dart';
import 'package:movie_app/src/core/network/handler/response_handler.dart';
import 'package:movie_app/src/features/bottombar/presentation/bloc/bottombar_bloc.dart';
import 'package:movie_app/src/features/watch_movie/data/datasources/movie_remote_datasource.dart';
import 'package:movie_app/src/features/watch_movie/data/datasources/movie_remote_datasource_impl.dart';
import 'package:movie_app/src/features/watch_movie/data/repositories/movie_repo_impl.dart';
import 'package:movie_app/src/features/watch_movie/domain/repositories/movie_repo.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_media_usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/src/features/watch_movie/domain/usecases/get_movie_usecase.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  // Response and Error handlers
  sl.registerLazySingleton<ResponseHandler>(() => ResponseHandler());
  sl.registerLazySingleton<ErrorHandler>(() => ErrorHandler());

  sl.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(dio: sl(), responseHandler: sl(), errorHandler: sl()),
  );

  // watch movie setup

  //blocs
  sl.registerLazySingleton(() => BottombarBloc());
  _movieInit();
}

void _movieInit() {
  sl.registerLazySingleton<MovieRemoteDatasource>(
    () => MovieRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(sl()));
  sl.registerLazySingleton(() => GetMovieUsecase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailUsecase(sl()));
  sl.registerLazySingleton(() => GetMediaUsecase(sl()));

  sl.registerLazySingleton(
    () => WatchMovieBloc(
      getMovieUsecase: sl(),
      getMovieDetailUsecase: sl(),

      getMediaUsecase: sl(),
    ),
  );
}
