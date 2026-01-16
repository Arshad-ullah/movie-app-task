import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/features/select_seat/presentation/bloc/select_seat_bloc.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  final List<String> dates = const [
    '5 Mar',
    '6 Mar',
    '7 Mar',
    '8 Mar',
    '9 Mar',
    '10 Mar',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: BlocBuilder<SelectSeatBloc, SelectSeatState>(
        builder: (context, state) {
          final selectedIndex = state.selectedDateIndex;

          return ListView.separated(
            padding: EdgeInsets.only(left: 26.w),
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  context.read<SelectSeatBloc>().add(DateSelectedEvent(index));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColor.kBlue61C3F2
                        : AppColor.kGrayA6A6A6.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              blurRadius: 21,
                              color: AppColor.kBlue61C3F2.withValues(
                                alpha: 0.27,
                              ),
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      dates[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColor.kWhite
                            : AppColor.kBlack202C43,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
