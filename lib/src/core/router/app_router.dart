import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/di/injection_container.dart' as di;
import 'package:movie_app/src/core/router/app_route_name.dart';
import 'package:movie_app/src/features/bottombar/presentation/bloc/bottombar_bloc.dart';
import 'package:movie_app/src/features/bottombar/presentation/pages/bottombar_screen.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/process_to_pay_screen.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/select_seat_screen.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/pages/trailer_play_screen.dart';
import 'package:movie_app/src/features/watch_movie/presentation/pages/watch_movie_detail_screen.dart';
import 'package:movie_app/src/features/watch_movie/presentation/pages/watch_movie_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRouteName.processToPay,
    routes: [
      GoRoute(
        path: AppRouteName.bottomBar,
        name: AppRouteName.bottomBarName,

        pageBuilder: (context, state) => MaterialPage(child: BottombarScreen()),
      ),

      GoRoute(
        path: AppRouteName.watchMovie,
        name: AppRouteName.watchMovieName,
        pageBuilder: (context, state) =>
            MaterialPage(child: WatchMovieScreen()),
      ),
      GoRoute(
        path: AppRouteName.watchMovieDetail,
        name: AppRouteName.watchMovieDetailName,
        pageBuilder: (context, state) =>
            MaterialPage(child: WatchMovieDetailScreen()),
      ),

      GoRoute(
        path: AppRouteName.playTrailer,
        name: AppRouteName.playTrailerName,
        pageBuilder: (context, state) {
          String url = state.extra as String;

          return MaterialPage(child: TrailerPlayerScreen(videoUrl: url));
        },
      ),

      GoRoute(
        path: AppRouteName.selectSeat,
        name: AppRouteName.selectSeatName,
        pageBuilder: (context, state) {
          return MaterialPage(child: SelectSeatScreen());
        },
      ),
      GoRoute(
        path: AppRouteName.processToPay,
        name: AppRouteName.processToPayName,
        pageBuilder: (context, state) {
          return MaterialPage(child: ProcessToPayScreen());
        },
      ),
    ],
  );
}
