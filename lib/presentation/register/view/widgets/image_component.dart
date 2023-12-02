import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          //left: 100,
            top: -32.h,
            left: 24.w,
            height: 291.h,
            width: 400.w,
            child: Image.asset(Assets.imagesLoginTire)),
        Positioned(
            top: 80.h,
            left: 35.w,
            height: 122.h,
            width: 318.w,
            child: Image.asset(Assets.imagesLoginLogo)),
        Positioned(
            top: 184.h,
            left: 120.w,
            height: 58.h,
            width: 147.w,
            child: Image.asset(Assets.imagesLoginText)),
      ],
    );
  }
}
