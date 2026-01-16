import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/constants/colors.dart';

class MoreItemScreen extends StatelessWidget {
  const MoreItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "More",
                  style: TextStyle(
                    color: AppColor.kBlack202C43,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColor.kWhiteF6F6FA,
              child: Center(
                child: Text(
                  "More item",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kBlack202C43,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
