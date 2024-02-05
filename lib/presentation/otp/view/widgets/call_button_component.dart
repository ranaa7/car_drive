import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../../../config/style/app_colors.dart';
import '../../../../config/style/text_styles.dart';
import '../../../../generated/assets.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 340.w,
        height: 58.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          // minimumSize: Size(0.w, 55.h),
            backgroundColor: AppColors.buttonOtp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          onPressed: () {
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Image.asset(Assets.imagesCallCenterIcon,width: 30.w,),
              SizedBox(width: 15.w,),
              Text( AppStrings.codeIsnotArrived,
                style: AppTextStyle.cairoNormal13white,
              ),

            ],
          ),
        ),
      );

  }
}
