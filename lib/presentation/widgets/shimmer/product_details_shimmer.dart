import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/increament_decreament.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
      width: 0.w,
      height: 0.h,
      child: Column(
        children: [
          CustomContainer(
            width: 243,
            height: 100,
            color: Colors.white,
            child: Container(),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomContainer(
            height: 55,
            width: 270,
            color: Colors.white,
            child: Container(),
          ),
          SizedBox(height: 10.h),
          RatingBarIndicator(
            rating: 5,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemCount: 5,
            itemSize: 50.0,
            direction: Axis.horizontal,
          ),
          Row(
            children: [
              const Expanded(
                child: CustomContainer(
                  color: Colors.white,
                  height: 20,
                  width: 50,
                  child: SizedBox(),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: IncreamentDecreament(
                  minusPressed: () {},
                  plusPressed: () {},
                ),
              ),
              const Spacer()
            ],
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
          SizedBox(
            height: 11.h,
          ),
          const CustomContainer(
            color: AppColors.white,
            height: 50,
            width: 250,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class AppBarShimmer extends StatelessWidget {
  const AppBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
        width: 0,
        height: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: const SizedBox(),
            ),
            Container(
              height: 30.h,
              width: 30.w,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: const SizedBox(),
            ),
            Container(
              height: 30.h,
              width: 30.w,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: const SizedBox(),
            ),
          ],
        ));
  }
}
