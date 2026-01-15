import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/features/watch_movie/presentation/widgets/shimer_img.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
      itemBuilder: (context, index) {
        return ShimmerImage(
          imageUrl: "https://via.placeholder.com/300x150",
          height: 150.h,
          width: double.infinity,
          borderRadius: 10.r,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.h);
      },
    );
  }
}
