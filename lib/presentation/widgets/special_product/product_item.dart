import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/product_price.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

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
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteName.productScreen);
      },
      child: Container(
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
              child:ProductPrice(details: details, discount: discount, price: price)
            ),
          ],
        ),
      ),
    );
  }
}
