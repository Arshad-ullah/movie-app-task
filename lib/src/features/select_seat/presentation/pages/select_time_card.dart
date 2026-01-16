import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/images.dart';

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          return _CardWidget();
        },
      ),
    );
  }
}

// card widget..

class _CardWidget extends StatelessWidget {
  const _CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 9.w,
          children: [
            Text(
              '12:30',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.kBlack202C43,
              ),
            ),
            Text(
              'Cinetech + hall 1',
              style: TextStyle(fontSize: 12.sp, color: AppColor.kGray8F8F8F),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 72.w, vertical: 16.h),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColor.kBlue61C3F2),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 1),
                color: AppColor.kBlack.withValues(alpha: .1),
              ),
            ],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(AppImage.mapImg),
        ),
        SizedBox(height: 5.h),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: 'From ',
                style: TextStyle(color: AppColor.kGray8F8F8F),
              ),
              TextSpan(
                text: '50\$',
                style: TextStyle(color: AppColor.kBlack202C43),
              ),
              TextSpan(
                text: ' or ',
                style: TextStyle(color: AppColor.kGray8F8F8F),
              ),
              TextSpan(
                text: '2500 bonus',
                style: TextStyle(color: AppColor.kBlack202C43),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
