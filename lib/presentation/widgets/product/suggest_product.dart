import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/product_price.dart';

class SuggestProduct extends StatelessWidget {
  final String image;
  final String details;
  final String strokedPrice;
  final String price;
  final bool hasDiscount;

  const SuggestProduct(
      {super.key,
      required this.details,
      required this.strokedPrice,
      required this.price,
      required this.hasDiscount,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
            color: AppColors.white,
            height: 235,
            width: 120,
            child: Column(
              crossAxisAlignment: context.isRTL
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomImageView(
                      url: image,
                      height: 140.h,
                      width: 150.w,
                      fit: BoxFit.cover),
                ),
                ProductPrice(
                  details: details,
                  strokedPrice: strokedPrice,
                  price: price,
                  hasDiscount: hasDiscount,
                )
              ],
            ))
      ],
    );
  }
}
