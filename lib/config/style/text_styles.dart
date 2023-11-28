import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/utils/strings/fonts.dart';


class AppTextStyle {
  ///FontsFamily
  static const TextStyle cairo = TextStyle(fontFamily: Fonts.cairo);

  ///FontsWeight
  static final TextStyle cairoExtraBold =
      cairo.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle cairoBold =
      cairo.copyWith(fontWeight: FontWeight.w600);
  static final TextStyle cairoSemiBold =
      cairo.copyWith(fontWeight: FontWeight.w500);
  static final TextStyle cairoMedium =
      cairo.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle cairoLight =
      cairo.copyWith(fontWeight: FontWeight.w300);
  static final TextStyle cairoExtraLight =
      cairo.copyWith(fontWeight: FontWeight.w200);
  static final TextStyle cairoThin =
      cairo.copyWith(fontWeight: FontWeight.w100);

  ///FontsSize
  static final TextStyle fontSize40 = TextStyle(fontSize: 40.sp);
  static final TextStyle fontSize28 = TextStyle(fontSize: 28.sp);
  static final TextStyle fontSize23 = TextStyle(fontSize: 23.sp);
  static final TextStyle fontSize20 = TextStyle(fontSize: 20.sp);
  static final TextStyle fontSize17 = TextStyle(fontSize: 17.sp);
  static final TextStyle fontSize15 = TextStyle(fontSize: 15.sp);
  static final TextStyle fontSize14 = TextStyle(fontSize: 14.sp);
  static final TextStyle fontSize13 = TextStyle(fontSize: 13.sp);
  static final TextStyle fontSize11 = TextStyle(fontSize: 11.sp);

  ///FontsColors


  static final TextStyle cairoBold11 =
  cairoBold.merge(fontSize11).copyWith(color: AppColors.white);
  static final TextStyle cairoMedium14 =
  cairoMedium.merge(fontSize14).copyWith(color: AppColors.grey2);
  static final TextStyle cairoSemiBold23 =
  cairoSemiBold.merge(fontSize23).copyWith(color: AppColors.grey2);
  static final TextStyle cairoSemiBold17 =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.grey2);
  static final TextStyle cairoThin11White =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.white);
  static final TextStyle cairoThin11Grey =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.grey);
  static final TextStyle cairoThin11Red =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.red);
  static final TextStyle cairoBold17Red =
  cairoBold.merge(fontSize17).copyWith(color: AppColors.red);
  static final TextStyle cairoSemiBold13LineThrough =
  cairoSemiBold.merge(fontSize13).copyWith(color: AppColors.grey2,decoration: TextDecoration.lineThrough,
    );


}
