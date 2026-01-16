import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/utils/helper.dart';
import 'package:movie_app/src/features/watch_movie/domain/entities/upcoming_movie_entity.dart';
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';

class MovieDetailBottomWidget extends StatelessWidget {
  const MovieDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.kBlack202C43,
            ),
          ),

          SizedBox(height: 14.h),

          BlocBuilder<WatchMovieBloc, WatchMovieState>(
            builder: (context, state) {
              final movie = Helper.getMovieEntity(
                state.upcomingMoviesEntity!.movies,
                state.movieId,
              );

              if (movie == null) return const SizedBox();

              final List<String> moviesType = Helper.mapGenres(movie.genreIds);

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: moviesType.map((genre) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: _genreColor(genre),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          genre,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),

          SizedBox(height: 22.h),
          // divider
          Divider(color: AppColor.kBlack.withValues(alpha: .05), height: 0),
        ],
      ),
    );
  }

  Color _genreColor(String genre) {
    switch (genre) {
      case 'Action':
        return AppColor.kBlue15D2BC;
      case 'Thriller':
        return AppColor.kPinkE26CA5;
      case 'Science Fiction':
        return AppColor.kPurpel564CA3;
      case 'Comedy':
        return AppColor.kGoldenCD9D0F;
      default:
        return AppColor.kGray827D88;
    }
  }
}
