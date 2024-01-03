import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CustomAppShimmer(
        width: 0,
        height: 0,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.white),
          child: FittedBox(
              child: CustomImageView(
                imagePath: Assets.imagesEmpty,
                height: 90.h,
                width: 90.h,
              )),
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        width: 10.w,
      ),
      itemCount: 10,
    );
  }
}
