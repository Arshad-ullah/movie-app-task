import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/images.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/select_seat_header.dart';
import 'package:movie_app/src/features/select_seat/presentation/widgets/customb_button.dart';

class ProcessToPayScreen extends StatelessWidget {
  const ProcessToPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: statusBarHeight),

          SelectseatHeader(subTitle: 'March 5, 2021  I  12:30 hall 1'),

          SizedBox(height: 15.h),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 0.h),
              width: double.infinity,
              color: AppColor.kWhiteF6F6FA,
              child: SvgPicture.asset(AppImage.chartImg),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.h),
                _RowItem(),
                SizedBox(height: 32.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColor.kGrayA6A6A6.withValues(alpha: .1),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 13.w,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "4/",
                              style: TextStyle(
                                color: AppColor.kBlack202C43,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: '\t3 row',
                              style: TextStyle(
                                color: AppColor.kBlack202C43,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(Icons.close, size: 20, color: AppColor.kBlack202C43),
                    ],
                  ),
                ),

                SizedBox(height: 35.h),
                _ProcessPayRowWidget(),

                SizedBox(height: 10.h),
              ],
            ),
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

class _ProcessPayRowWidget extends StatelessWidget {
  const _ProcessPayRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10.w,
      children: [
        Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 20.w, top: 9.h, right: 38.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColor.kGrayA6A6A6.withValues(alpha: .1),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: TextStyle(fontSize: 10.sp, color: AppColor.kBlack202C43),
              ),
              Text(
                "\$ 50",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.kBlack202C43,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        Expanded(child: CustomButton(text: "Proceed to pay")),
      ],
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20.w,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RowWidget(color: AppColor.kGoldenCD9D0F, text: "Selected"),
            SizedBox(height: 15.h),
            _RowWidget(color: AppColor.kPurpel564CA3, text: "VIP (150\$)"),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RowWidget(color: AppColor.kGrayA6A6A6, text: "Not available"),
            SizedBox(height: 15.h),
            _RowWidget(color: AppColor.kBlue61C3F2, text: "Regular (50 \$)"),
          ],
        ),
      ],
    );
  }
}

class _RowWidget extends StatelessWidget {
  final Color color;
  final String text;
  const _RowWidget({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.w,
      children: [
        SvgPicture.asset(AppImage.seatIcon, color: color),

        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.kGray8F8F8F,
          ),
        ),
      ],
    );
  }
}
