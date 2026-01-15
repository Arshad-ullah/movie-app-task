import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/src/core/constants/colors.dart';
import 'package:movie_app/src/core/constants/images.dart';
import 'package:movie_app/src/core/constants/strings.dart';
import 'package:movie_app/src/features/bottombar/presentation/bloc/bottombar_bloc.dart';

class BottomNavBar extends StatelessWidget {
  static final List<_NavItemData> _navItems = [
    _NavItemData(AppImage.dashBoardIcon, AppString.dashoBoard),
    _NavItemData(AppImage.watchIcon, AppString.watch),
    _NavItemData(AppImage.mediaIcon, AppString.mediaLibrary),
    _NavItemData(AppImage.listIcon, AppString.more),
  ];

  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
        color: AppColor.kPerpule2E2739,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _navItems.length,
          (index) => _NavItem(
            iconPath: _navItems[index].iconPath,
            label: _navItems[index].label,
            index: index,
            isSelected: index == currentIndex,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final int index;
  final bool isSelected;

  const _NavItem({
    required this.iconPath,
    required this.label,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<BottombarBloc>().add(BottomOnChangedEvent(index)),
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: isSelected ? AppColor.kWhite : AppColor.kGray827D88,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColor.kWhite : AppColor.kGray827D88,
                fontSize: 10.sp,
                fontFamily: "Roboto",
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItemData {
  final String iconPath;
  final String label;

  const _NavItemData(this.iconPath, this.label);
}
