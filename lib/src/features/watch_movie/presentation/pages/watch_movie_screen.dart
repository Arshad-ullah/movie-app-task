import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/di/injection_container.dart' as di;
import 'package:movie_app/src/features/watch_movie/presentation/bloc/watch_movie_bloc.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/movie_listview_widget.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/rounded_textfield.dart';

class WatchMovieScreen extends StatelessWidget {
  const WatchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: statusBarHeight),

          // header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<WatchMovieBloc, WatchMovieState>(
              builder: (context, state) {
                if (state.isSeaching) {
                  return RoundedSearchTextField(
                    onChanged: (value) {
                      context.read<WatchMovieBloc>().add(SearchEvent(value));
                    },
                    onTap: () {
                      context.read<WatchMovieBloc>().add(
                        SearchButtonClickEvent(),
                      );
                    },
                  );
                }

                return _HeaderRowWidget();
              },
            ),
          ),

          SizedBox(height: 27.h),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: AppColor.kWhiteF6F6FA,
              child: MovieListView(),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRowWidget extends StatelessWidget {
  const _HeaderRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Watch",
          style: TextStyle(
            color: AppColor.kBlack202C43,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<WatchMovieBloc>().add(SearchButtonClickEvent());
          },
          child: Icon(Icons.search_rounded, color: AppColor.kBlack202C43),
        ),
      ],
    );
  }
}
