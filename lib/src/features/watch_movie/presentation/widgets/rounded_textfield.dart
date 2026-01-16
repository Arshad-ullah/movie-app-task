import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/colors.dart';

class RoundedSearchTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const RoundedSearchTextField({super.key, this.onChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.kWhitF2F2F6,
        hintText: 'TV shows, movies and more',
        prefixIcon: Icon(Icons.search, color: AppColor.kBlack202C43),
        suffixIcon: IconButton(
          icon: Icon(Icons.close, color: AppColor.kBlack202C43),
          onPressed: onTap,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColor.kWhiteEFEFEF, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColor.kWhiteEFEFEF, width: 1),
        ),
      ),
    );
  }
}
