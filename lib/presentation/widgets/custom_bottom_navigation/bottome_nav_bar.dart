import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {

    final iconList = [
      Assets.svgHome,
      Assets.svgCategory,
      Assets.svgNotification,
      Assets.svgProfile
    ];
    final iconTitles = [
      AppStrings.home,
      AppStrings.category,
      AppStrings.notification,
      AppStrings.profile
    ];
    return AnimatedBottomNavigationBar.builder(

      height: 70.h,
      activeIndex: currentIndex,
      notchMargin: 0.0,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (int index) => onTap?.call(index),
      itemCount: 4,
      tabBuilder: (int index, bool isActive) => _bottomNavItem(text: iconTitles[index], icon: iconList[index], index: index),
      //other params
    );
    //   BottomAppBar(
    //   shape:const CircularNotchedRectangle(),
    //   notchMargin: 2,
    //   color: AppColors.white,
    //   height: 70.h,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       _bottomNavItem(text: AppStrings.home, icon: Assets.svgHome, index: 0),
    //       _bottomNavItem(
    //           text: AppStrings.category, icon: Assets.svgCategory, index: 1),
    //       SizedBox(width: 40.w,),
    //       _bottomNavItem(
    //           text: AppStrings.notification,
    //           icon: Assets.svgNotification,
    //           index: 2),
    //       _bottomNavItem(
    //           text: AppStrings.profile, icon: Assets.svgProfile, index: 3),
    //     ],
    //   ),
    // );
  }

  Widget _bottomNavItem(
      {required String text, required String icon, required int index}) {
    final bool isSelected = currentIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          svgPath: icon,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.contain,
        ),
        Text(text,
            style: isSelected
                ? AppTextStyle.cairoSemiBold15Red
                : AppTextStyle.cairoSemiBold15Grey)
            .animate()
            .fit()
      ],
    );
  }
}
