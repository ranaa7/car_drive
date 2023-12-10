// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppShimmer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;

  const CustomAppShimmer(
      {super.key, this.child,  this.width,  this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey4,
      highlightColor: AppColors.white,
      child:child??Container(
          width:width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGray,
          ),
          child: child),
    );
  }
}
