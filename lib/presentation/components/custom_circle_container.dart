import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';

class CustomCircleContainer extends StatelessWidget {
  final String image;
  final int imageHeight;
  final int imageWidth;
  final int containerWidth;
  final int containerHeight;

  const CustomCircleContainer(
      {super.key, required this.image, required this.imageHeight, required this.imageWidth, required this.containerWidth, required this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor: AppColors.white,
      child: CustomImageView(imagePath: image,
          fit: BoxFit.contain,
          height: imageHeight.h,
          width: imageWidth.w),);
  }
}
