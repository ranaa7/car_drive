import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class Button2 extends StatelessWidget {
  final int height;
  final int width;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;

  const Button2(
      {super.key,
      required this.height,
      required this.width,
      required this.onPressed,
      required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: AppColors.red3,),

          height: height.h,
          width: width.w,
          child: Row(
            children: [
              InkWell(
                onTap: onPressed2,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.blue),
                    width: 155.w,
                    height: height.h,
                    child: Text(
                      AppStrings.updateCart,
                      style: AppTextStyle.cairoMedium20white,
                    )),
              ),
              Expanded(
                child: FittedBox(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      AppStrings.continueToSelectCar,
                      style: AppTextStyle.cairoBold32White,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
