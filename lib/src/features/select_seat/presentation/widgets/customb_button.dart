import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.width,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.kBlue61C3F2,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.kWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
