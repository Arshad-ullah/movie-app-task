import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/constants/colors.dart';

class SelectseatHeader extends StatelessWidget {
  final String subTitle;
  const SelectseatHeader({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'The King’s Man',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kBlack202C43,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.kBlue61C3F2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }
}
