import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/images.dart';
import 'package:movie_app/src/core/router/app_route_name.dart';
import 'package:movie_app/src/features/select_seat/presentation/bloc/select_seat_bloc.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/select_date_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/select_seat_header.dart';
import 'package:movie_app/src/features/select_seat/presentation/pages/select_time_card.dart';
import 'package:movie_app/src/features/select_seat/presentation/widgets/customb_button.dart';

class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectSeatBloc(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: statusBarHeight),

            SelectseatHeader(subTitle: 'In theaters December 22, 2021'),

            SizedBox(height: 15.h),

            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColor.kWhiteF6F6FA,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 94.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.w),
                      child: Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColor.kBlack202C43,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    // select date widget..
                    DateSelector(),

                    SizedBox(height: 39.h),

                    // selectTime Widget..
                    SelectTimeWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: CustomButton(
            onPressed: () {
              context.push(AppRouteName.processToPay);
            },
            text: "Select Seats",
          ),
        ),
      ),
    );
  }
}
