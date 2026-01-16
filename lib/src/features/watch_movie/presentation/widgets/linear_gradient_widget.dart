import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';

class LinearGradientWidget extends StatelessWidget {
  final double height;
  final double radius;
  const LinearGradientWidget({super.key, this.height = 70, this.radius = 10});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,

      child: Container(
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius.r),

            bottomRight: Radius.circular(radius.r),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.kTransparent, AppColor.kBlack],
          ),
        ),
      ),
    );
  }
}
