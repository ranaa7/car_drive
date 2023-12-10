
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderShimmer extends StatelessWidget {
  const OrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
      width: 0,
      height: 0,
      child: Container(
        width: 420.w,
        height: 100.h,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: CustomImageView(imagePath: Assets.imagesEmpty,fit: BoxFit.fill,) ,
      ).paddingSymmetric(horizontal: 5.w),
    );
  }
}
