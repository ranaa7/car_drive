import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/product_price.dart';

class SuggestProduct extends StatelessWidget {
  final String details;
  final String strokedPrice;
  final String price;
  final bool hasDiscount;

  const SuggestProduct(
      {super.key,
      required this.details,
      required this.strokedPrice,
      required this.price, required this.hasDiscount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          color: AppColors.white,
            height: 113,
            width: 395,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.circular(10),
                  child: CustomImageView(
                    imagePath: Assets.imagesProduct,
                    height: 113.h,
                    width: 113.w,
                  ),
                ),
                SizedBox(width: 30.w,),
                ProductPrice(details: details, strokedPrice: strokedPrice, price: price,hasDiscount: hasDiscount,)
              ],
            ))
      ],
    );
  }
}
