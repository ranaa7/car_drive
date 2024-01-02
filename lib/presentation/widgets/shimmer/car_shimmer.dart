import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class CarShimmer extends StatelessWidget {
  const CarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 20.h, bottom: 150.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CustomAppShimmer(
        width: 0,
        height: 0,
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 30.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: AppShadows.shadow3,
              color: AppColors.white),
          height: 87.h,
          width: 352.w,

        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 15.h,
      ),
      itemCount: 10,
    );
  }
}
