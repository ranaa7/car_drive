// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(alignment:Alignment.topRight,child: Image.asset(Assets.imagesLoginTire,fit: BoxFit.fill,width: 486.w,height: 290.h,)),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 80.0.h),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Image.asset(Assets.imagesLoginLogo,fit: BoxFit.cover,height: 122.h,width: 318.w,),
                Text(AppStrings.register,style: AppTextStyle.cairoSemiBold24white,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
