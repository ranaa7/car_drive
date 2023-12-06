import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/product_price.dart';

class ProductItem extends StatelessWidget {
  final bool hasDiscount;
  final String details;
  final String price;
  final String discount;
  final String strokedPrice;
  final String image;

  const ProductItem(
      {super.key,
      required this.details,
      required this.price,
      required this.image,
      required this.discount, required this.hasDiscount, required this.strokedPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      height: 268.h,
      width: 150.w,
      child: Column(
        crossAxisAlignment: context.isRTL?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              height: 160.h,
              width: 163.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: context.isRTL?Alignment.topRight:Alignment.topLeft,
                  children: [
                    CustomImageView(
                      width: 163.w,
                      url: image,
                      fit: BoxFit.cover,
                    ),
                    hasDiscount?CustomContainer(height: 30, width: 50,color: AppColors.red2, child: Center(child: Text(discount,style: AppTextStyle.cairoBold13White,)),):const SizedBox()
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 4.h),
            child:ProductPrice(details: details, strokedPrice: strokedPrice, price: price,hasDiscount: hasDiscount,)
          ),
        ],
      ),
    );
  }
}
