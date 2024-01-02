import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/utils/strings/fonts.dart';


class AppTextStyle {
  ///FontsFamily
  static const TextStyle cairo = TextStyle(fontFamily: Fonts.cairo);

  ///FontsWeight
  static final TextStyle cairoBlack =
      cairo.copyWith(fontWeight: FontWeight.w900);
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
  static final TextStyle fontSize48 = TextStyle(fontSize: 48.sp);
  static final TextStyle fontSize36 = TextStyle(fontSize: 36.sp);
  static final TextStyle fontSize32 = TextStyle(fontSize: 32.sp);
  static final TextStyle fontSize28 = TextStyle(fontSize: 28.sp);
  static final TextStyle fontSize25 = TextStyle(fontSize: 25.sp);
  static final TextStyle fontSize24 = TextStyle(fontSize: 24.sp);

  static final TextStyle fontSize23 = TextStyle(fontSize: 23.sp);
  static final TextStyle fontSize20 = TextStyle(fontSize: 20.sp);
  static final TextStyle fontSize17 = TextStyle(fontSize: 17.sp);
  static final TextStyle fontSize16 = TextStyle(fontSize: 16.sp);
  static final TextStyle fontSize15 = TextStyle(fontSize: 15.sp);
  static final TextStyle fontSize14 = TextStyle(fontSize: 14.sp);
  static final TextStyle fontSize13 = TextStyle(fontSize: 13.sp);
  static final TextStyle fontSize12 = TextStyle(fontSize: 12.sp);
  static final TextStyle fontSize11 = TextStyle(fontSize: 11.sp);


  ///FontsColors


  static final TextStyle cairoBold11 =
  cairoBold.merge(fontSize11).copyWith(color: AppColors.white);
  static final TextStyle cairoBlack48White =
  cairoBlack.merge(fontSize48).copyWith(color: AppColors.white);
  static final TextStyle cairoBlack36White =
  cairoBlack.merge(fontSize36).copyWith(color: AppColors.white);
  static final TextStyle cairoMedium36White =
  cairoMedium.merge(fontSize36).copyWith(color: AppColors.white);
  static final TextStyle cairoMedium14Grey =
  cairoMedium.merge(fontSize14).copyWith(color: AppColors.grey2);
  static final TextStyle cairoMedium14Black =
  cairoMedium.merge(fontSize14).copyWith(color: AppColors.black);
  static final TextStyle cairoMedium16Blue =
  cairoMedium.merge(fontSize16).copyWith(color: AppColors.blue);
  static final TextStyle cairoMedium16White =
  cairoMedium.merge(fontSize16).copyWith(color: AppColors.white);
  static final TextStyle cairoBold16White =
  cairoBold.merge(fontSize16).copyWith(color: AppColors.white);
  static final TextStyle cairoSemiBold23 =
  cairoSemiBold.merge(fontSize23).copyWith(color: AppColors.grey2);
  static final TextStyle cairoMedium20Grey =
  cairoMedium.merge(fontSize20).copyWith(color: AppColors.grey2);
  static final TextStyle cairoMedium24White =
  cairoMedium.merge(fontSize24).copyWith(color: AppColors.white);
  static final TextStyle cairoMedium28black =
  cairoMedium.merge(fontSize28).copyWith(color: AppColors.black);

  static final TextStyle cairoSemiBold23black =
  cairoSemiBold.merge(fontSize23).copyWith(color: AppColors.black);

  static final TextStyle cairoRegular20white =
      cairo.merge(fontSize20).copyWith(color: AppColors.white);
  static final TextStyle cairoBold20white =
      cairoBold.merge(fontSize20).copyWith(color: AppColors.white);

  static final TextStyle cairoBold25white =
  cairoBold.merge(fontSize25).copyWith(color: AppColors.white);
  static final TextStyle cairoBold20black =
  cairoBold.merge(fontSize20).copyWith(color: AppColors.black);

  static final TextStyle cairoBold15black =
  cairoBold.merge(fontSize15).copyWith(color: AppColors.black);

  static final TextStyle cairoBold20blue =
  cairoBold.merge(fontSize20).copyWith(color: AppColors.blue);
  static final TextStyle cairo20grey5 =
  cairo.merge(fontSize20).copyWith(color: AppColors.grey5);

  static final TextStyle cairoSemiBold17white =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.white);
  static final TextStyle cairoSemiBold17Black =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.black);
  static final TextStyle cairoSemiBold15Grey =
  cairoSemiBold.merge(fontSize15).copyWith(color: AppColors.grey2);
  static final TextStyle cairoSemiBold16 =
  cairoSemiBold.merge(fontSize16).copyWith(color: AppColors.white);


  static final TextStyle cairoBoldgrey20 =
  cairoBold.merge(fontSize20).copyWith(color: AppColors.grey2);
  static final TextStyle cairoSemiBold17Red =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.red);
  static final TextStyle cairoSemiBold15Red =
  cairoSemiBold.merge(fontSize15).copyWith(color: AppColors.red);
  static final TextStyle cairoThin11White =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.white);
  static final TextStyle cairoBold13White =
  cairoBold.merge(fontSize13).copyWith(color: AppColors.white);
  static final TextStyle cairoThin11Grey =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.grey);
  static final TextStyle cairoThin13Grey =
  cairoThin.merge(fontSize13).copyWith(color: AppColors.black);
  static final TextStyle cairoSemiBold12Grey =
  cairoSemiBold.merge(fontSize12).copyWith(color: AppColors.grey);
  static final TextStyle cairoSemiBold12Black =
  cairoSemiBold.merge(fontSize12).copyWith(color: AppColors.black);
  static final TextStyle cairoThin11Red =
  cairoThin.merge(fontSize11).copyWith(color: AppColors.red);
  static final TextStyle cairoBold17Red =
  cairoBold.merge(fontSize17).copyWith(color: AppColors.red);

  static final TextStyle cairoBold17DarkRed =
  cairoBold.merge(fontSize17).copyWith(color: AppColors.darkRed);

  static final TextStyle cairoBold24DarkRed =
  cairoBold.merge(fontSize24).copyWith(color: AppColors.darkRed);

  static final TextStyle cairoSemiBold17DarkRed =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.darkRed);

  static final TextStyle cairoSemiBold17green =
  cairoSemiBold.merge(fontSize17).copyWith(color: AppColors.green1);
  static final TextStyle cairoSemiBold16white =
  cairoSemiBold.merge(fontSize16).copyWith(color: AppColors.white);

  static final TextStyle cairoSemiBold16black =
  cairoSemiBold.merge(fontSize16).copyWith(color: AppColors.black);

  static final TextStyle cairoSemiBold16DarkBlue =
  cairoSemiBold.merge(fontSize16).copyWith(color: AppColors.darkBlue);

  static final TextStyle cairoSemiBold12DarkBlue =
  cairoSemiBold.merge(fontSize12).copyWith(color: AppColors.darkBlue);

  static final TextStyle cairoSemiBold12DarkRed =
  cairoSemiBold.merge(fontSize12).copyWith(color: AppColors.darkRed);



  static final TextStyle cairoSemiBold24white =
  cairoSemiBold.merge(fontSize24).copyWith(color: AppColors.white);



  static final TextStyle cairoMedium15grey1 =
      cairoMedium.merge(fontSize15).copyWith(color: AppColors.grey1);
  static final TextStyle cairoMedium15white =
  cairoMedium.merge(fontSize15).copyWith(color: AppColors.white);
  static final TextStyle cairoBold15white =
  cairoBold.merge(fontSize15).copyWith(color: AppColors.white);
  static final TextStyle cairoBold32White =
  cairoBold.merge(fontSize32).copyWith(color: AppColors.white);
  static final TextStyle cairoSemiBold13LineThroughGrey =
  cairoSemiBold.merge(fontSize13).copyWith(color: AppColors.grey2,decoration: TextDecoration.lineThrough,
  );
  static final TextStyle cairoSemiBold14LineThroughWhite =
  cairoSemiBold.merge(fontSize14).copyWith(color: AppColors.white,decoration: TextDecoration.lineThrough,
    );


}
