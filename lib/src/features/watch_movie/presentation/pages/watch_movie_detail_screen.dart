import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/constants/api_endpoints.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/router/app_route_name.dart';
import 'package:movie_app/src/core/utils/helper.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/pages/trailer_play_screen.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/linear_gradient_widget.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/media_builder.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/movie_detail_bottom_widget.dart';
import 'package:shimmer/shimmer.dart';

class WatchMovieDetailScreen extends StatelessWidget {
  const WatchMovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WatchMovieBloc, WatchMovieState>(
        buildWhen: (previous, current) =>
            previous.isDetailPageLoading != current.isDetailPageLoading,

        builder: (context, state) {
          if (state.isDetailPageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350.h,
                child: Stack(
                  children: [
                    // bg imge..
                    _BackgroundImageWidget(),
                    // bottom linear graident..
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: LinearGradientWidget(height: 100.h, radius: 0),
                    ),
                    // header buttons..
                    _HeaderWidget(),
                  ],
                ),
              ),
              SizedBox(height: 27.h),

              // bottom widget..
              MovieDetailBottomWidget(),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kBlack202C43,
                          ),
                        ),

                        SizedBox(height: 14.h),
                        BlocBuilder<WatchMovieBloc, WatchMovieState>(
                          buildWhen: (previous, current) =>
                              previous.movieId != current.movieId,
                          builder: (context, state) {
                            MovieEntity? moive = Helper.getMovieEntity(
                              state.upcomingMoviesEntity!.movies,
                              state.movieId,
                            );
                            return Text(
                              moive?.overview ?? "",

                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.kGray8F8F8F,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w),

      width: double.infinity,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: statusBarHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios, color: AppColor.kWhite),
              ),

              Text(
                "Watch",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.kWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _LogoWidget(),

              SizedBox(height: 6.h),
              Text(
                "In theaters december 22, 2021",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.kWhite,
                ),
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(243.w, 48.h),
                  backgroundColor: AppColor.kBlue61C3F2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // radius 10
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Get Tickets',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.kWhite,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              BlocBuilder<WatchMovieBloc, WatchMovieState>(
                buildWhen: (previous, current) =>
                    previous.movieDetailVideoEntity !=
                    current.movieDetailVideoEntity,
                builder: (context, state) {
                  return OutlinedButton(
                    onPressed: () {
                      final trailerUrl = Helper.getTrailerUrl(
                        state.movieDetailVideoEntity!,
                      );

                      if (trailerUrl == null) return;

                      context.push(AppRouteName.playTrailer, extra: trailerUrl);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(243.w, 48.h),
                      side: const BorderSide(
                        color: AppColor.kBlue61C3F2,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8.w,

                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: AppColor.kWhite,

                          size: 20,
                        ),
                        Text(
                          'Watch Trailer',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.kWhite,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaEntityBuilder(
      builder: (context, media) {
        if (media.logos.isEmpty) {
          return const SizedBox.shrink();
        }

        return CachedNetworkImage(
          imageUrl: ApiEndpoints.imgBaseUrl + media.logos.first.filePath,
          height: 30.h,
          width: 102.w,
        );
      },
    );
  }
}

class _BackgroundImageWidget extends StatelessWidget {
  const _BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaEntityBuilder(
      builder: (context, media) {
        if (media.posters.isEmpty) {
          return const SizedBox.shrink();
        }

        return CachedNetworkImage(
          imageUrl: ApiEndpoints.imgBaseUrl + media.posters.first.filePath,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
