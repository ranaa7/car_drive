import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
        width: 0,
        height: 0,
        child: SizedBox(
          height: 300.h,
          width: 400.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppColors.white),
                  height: 268.h,
                  width: 150.w,),
              separatorBuilder: (context, index) => SizedBox(
                    width: 18.w,
                  ),
              itemCount: 3),
        ));
  }
}
