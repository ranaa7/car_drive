import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';

class ImageOtpComponent extends StatelessWidget {
  const ImageOtpComponent({super.key});

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
            top: 30.h,
            left: 35.w,
            height: 122.h,
            width: 318.w,
            child: Image.asset(Assets.imagesTextotpLogo)),
        Positioned(
            top: 120.h,
            left: 60.w,
            height: 260.h,
            width: 260.w,
            child: Image.asset(Assets.imagesOtpLogo)),
      ],
    );
  }
}
