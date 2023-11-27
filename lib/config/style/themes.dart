import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/utils/strings/fonts.dart';


class Themes {
  static ThemeData get defaultTheme => ThemeData(
      fontFamily: Fonts.cairo,
      primaryColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        color: AppColors.black,
        titleTextStyle: TextStyle(color: AppColors.black),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColors.darkBlue,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.black)
          .copyWith(background: AppColors.black));
}
