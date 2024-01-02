import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/presentation/components/services_row.dart';

class PickUpContainer extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String pickupName;
  final String pickupLocation;

  const PickUpContainer(
      {super.key,
      required this.pickupName,
      required this.pickupLocation, required this.selectedIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395.w,
      height: 120.h,
      decoration: BoxDecoration(
          boxShadow: AppShadows.shadow3,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
              color: selectedIndex==index ? AppColors.red : AppColors.white, width: 1.w),
          color: Colors.white),
      child: Row(
        children: [
          const ImageContainer(
            width: 136,
            height: 120,
            image: Assets.imagesPickup,
          ),
          Column(
            children: [
              Text(
                pickupName,
                style: AppTextStyle.cairoMedium14Black,
              ),
              Text(
                pickupLocation,
                style: AppTextStyle.cairoMedium11Grey,
              ),
              const Expanded(child: ServicesRow()),
            ],
          ),
          selectedIndex==index
              ? FittedBox(
                child: CustomImageView(
                    imagePath: Assets.imagesTrue,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
              )
              : const SizedBox()
        ],
      ),
    );
  }
}
