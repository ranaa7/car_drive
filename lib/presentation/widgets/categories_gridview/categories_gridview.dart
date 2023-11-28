import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Text(AppStrings.specialProduct,style: AppTextStyle.cairoSemiBold23, ),
        ),
        SizedBox(height: 15.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
          child: SizedBox(
            height: 300.h,
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  children: [
                    CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,height: 141.h,width: 210.w,),
                    SizedBox(height: 2.h,),
                    CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,height: 141.h,width: 210.w,),
                  ],
                ),
                SizedBox(width: 2.w,),
                Column(
                  children: [
                    CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,height: 141.h,width: 210.w,),
                    SizedBox(height: 2.h,),
                    CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,height: 141.h,width: 210.w,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
