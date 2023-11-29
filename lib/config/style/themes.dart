import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/utils/strings/fonts.dart';


class Themes {
  static ThemeData get defaultTheme => ThemeData(
      fontFamily: Fonts.cairo,
      primaryColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
        titleTextStyle: TextStyle(color: AppColors.white),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColors.darkBlue,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.white)
          .copyWith(background: AppColors.white));
}
