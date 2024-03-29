import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/utils/strings/fonts.dart';


class Themes {
  static ThemeData get defaultTheme => ThemeData(

      useMaterial3: false,
      fontFamily: Fonts.cairo,
      primaryColor: AppColors.blue,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blue),
        color: AppColors.black,
        titleTextStyle: TextStyle(color: AppColors.black),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldGround,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.blue)
          .copyWith(background: AppColors.blue));
}
