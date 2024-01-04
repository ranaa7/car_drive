import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class UserAddressShimmer extends StatelessWidget {
  const UserAddressShimmer({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          width: 386.w,
          height: 230.h,
          decoration: BoxDecoration(
              boxShadow: AppShadows.shadow3,
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white),
          child: const SizedBox(),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 15.h,
      ),
      itemCount: 10,
    );
  }
}
