import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/features/bottombar/presentation/bloc/bottombar_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'src/core/router/app_router.dart';
import 'src/core/di/injection_container.dart' as di;

double statusBarHeight = 20;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int value = kIsWeb
        ? 10
        : (defaultTargetPlatform == TargetPlatform.iOS ? 0 : 10);
    statusBarHeight = MediaQuery.of(context).padding.top + value;
    return ScreenUtilInit(
      designSize: const Size(408, 644),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => di.sl<BottombarBloc>()),
            BlocProvider(
              create: (context) =>
                  di.sl<WatchMovieBloc>()..add(GetWatchMovieEvent()),
            ),
          ],
          child: MaterialApp.router(
            title: 'Movie App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.kWhite,
              fontFamily: "Poppins",
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
