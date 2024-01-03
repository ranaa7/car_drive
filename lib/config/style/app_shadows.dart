import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';

class AppShadows {
  static const List<BoxShadow> shadow1 = [
    BoxShadow(color: AppColors.black, offset: Offset(0, 3), blurRadius: 25),
  ];
  static const List<BoxShadow> shadow3 = [
    BoxShadow(color: AppColors.shadow3, blurRadius: 80, offset: Offset(0, 50)
    )];
}
