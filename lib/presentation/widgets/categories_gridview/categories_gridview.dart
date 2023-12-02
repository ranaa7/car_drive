import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class CategoriesGridView extends StatelessWidget {
  final String image;

  const CategoriesGridView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Text(AppStrings.specialCategories,style: AppTextStyle.cairoSemiBold17Black, ),
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 290.h,
          child: Row(
            children: [
              Column(
                children: [
                  ImageContainer(image: image, height: 141, width: 209),
                  SizedBox(height: 2.h,),
                  ImageContainer(image: image, height: 141, width: 209),
                ],
              ),
              SizedBox(width: 2.w,),
              Column(
                children: [
                  ImageContainer(image: image, height: 141, width: 209),

                  SizedBox(height: 2.h,),
                  ImageContainer(image: image, height: 141, width: 209),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
