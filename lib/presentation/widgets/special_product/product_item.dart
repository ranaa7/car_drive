import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';

class ProductItem extends StatelessWidget {
  final String details;
  final String price;
  final String discount;
  final String image;

  const ProductItem(
      {super.key,
      required this.details,
      required this.price,
      required this.image,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      height: 268.h,
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              height: 163.h,
              width: 163.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomImageView(
                  imagePath: image,
                  fit: BoxFit.cover,
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  details,
                  style: AppTextStyle.cairoThin11Grey,
                ),
                SizedBox(
                  height: 4.h,
                ),

                Text(
                  discount,
                  style: AppTextStyle.cairoSemiBold13LineThrough,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  price,
                  style: AppTextStyle.cairoBold17Red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
