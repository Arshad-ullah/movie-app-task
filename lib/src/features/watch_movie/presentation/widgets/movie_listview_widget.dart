import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/constants/api_endpoints.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/router/app_route_name.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/linear_gradient_widget.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/loading_widget.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/shimer_img.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchMovieBloc, WatchMovieState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.upcomingMoviesEntity != current.upcomingMoviesEntity,

      builder: (context, state) {
        if (state.status == Status.loading) {
          return LoadingWidget();
        } else if (state.status == Status.error) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: 16.sp, color: AppColor.kBlack202C43),
            ),
          );
        }

        // Success state: show movies
        return ListView.separated(
          itemCount: state.upcomingMoviesEntity?.movies.length ?? 0,
          padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
          itemBuilder: (context, index) {
            final data = state.upcomingMoviesEntity!.movies[index];
            return GestureDetector(
              onTap: () {
                context.push(AppRouteName.watchMovieDetail);
                context.read<WatchMovieBloc>().add(
                  GetWatchMovieDetailEvent(movieId: data.id.toString()),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,

                children: [
                  ShimmerImage(
                    imageUrl: "${ApiEndpoints.imgBaseUrl}/${data.backdropPath}",
                    height: 180.h,
                    width: double.infinity,
                    borderRadius: 10.r,
                  ),

                  // Linear gradient..
                  LinearGradientWidget(),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
        );
      },
    );
  }
}

class _NotfoundWidget extends StatelessWidget {
  const _NotfoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Not found",
        style: TextStyle(
          color: AppColor.kBlack202C43,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
