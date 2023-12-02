import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:const CircularNotchedRectangle(),
      notchMargin: 5,
      color: AppColors.white,
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bottomNavItem(text: AppStrings.home, icon: Assets.svgHome, index: 0),
          _bottomNavItem(
              text: AppStrings.category, icon: Assets.svgCategory, index: 1),
          SizedBox(width: 40.w,),
          _bottomNavItem(
              text: AppStrings.notification,
              icon: Assets.svgNotification,
              index: 2),
          _bottomNavItem(
              text: AppStrings.profile, icon: Assets.svgProfile, index: 3),
        ],
      ),
    );
  }

  Widget _bottomNavItem(
      {required String text, required String icon, required int index}) {
    final bool isSelected = currentIndex == index;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => onTap?.call(index),
            child: CustomImageView(
              svgPath: icon,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),

          // if (isSelected) SizedBox(height: 4.h,),
            Text(text, style: AppTextStyle.cairoSemiBold17Red).animate().fade()
        ],
      ),
    );
  }
}
