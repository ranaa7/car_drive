import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/increament_decreament.dart';
import 'package:more_2_drive/presentation/widgets/suggest_product/suggest_product.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ProductDetails extends StatelessWidget {
  final bool hasDiscount;
  final String productName;
  final String productPrice;
  final String discount;
  final int availableProduct;
  final String pointsString;
  final int pointsNumber;
  final String sellerLogo;
  final String sellerString;
  final String sellerName;
  final String sellerImage;
  final String detailsString;
  final String details;
  final int productCount;

  const ProductDetails(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.discount,
      required this.availableProduct,
      required this.pointsString,
      required this.pointsNumber,
      required this.sellerLogo,
      required this.sellerString,
      required this.sellerName,
      required this.detailsString,
      required this.details,
      required this.sellerImage,
      this.productCount = 0, required this.hasDiscount});

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r'<[^>]*>|&[^;]+;',multiLine: true,caseSensitive: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 243.w,
            height: 100.h,
            child: Text(
              productName,
              style: AppTextStyle.cairoMedium24White,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
        SizedBox(
          height: 15.h,
        ),
        CustomContainer(
            height: 55,
            width: 270,
            color: AppColors.red3,
            child: FittedBox(
              child: Text(
                productPrice,
                style: AppTextStyle.cairoBlack48White,
              ),
            )),
        SizedBox(height: 3.h),
        hasDiscount?Text(
          discount,
          style: AppTextStyle.cairoSemiBold14LineThroughWhite,
        ):SizedBox(height: 5.h,),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              svgPath: Assets.svgStar,
            ),
            CustomImageView(
              svgPath: Assets.svgStar,
            ),
            CustomImageView(
              svgPath: Assets.svgStar,
            ),
            CustomImageView(
              svgPath: Assets.svgStar,
            ),
            CustomImageView(
              svgPath: Assets.svgStar,
            ),
          ],
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          children: [
            Text(
              "(${"${AppStrings.availableProduct} ""$availableProduct"})",
              style: AppTextStyle.cairoMedium16White,
            ),
            SizedBox(
              width: 20.w,
            ),
            const IncreamentDecreament()
          ],
        ),
        SizedBox(
          height: 17.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              color: AppColors.red3,
              height: 50,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomImageView(
                    height: 21.h,
                    width: 21.w,
                    svgPath: Assets.svgCoins,
                  ),
                  Text(
                    AppStrings.pointsString,
                    style: AppTextStyle.cairoBold16White,
                  ),
                  Text(
                    "$pointsNumber",
                    style: AppTextStyle.cairoBold16White,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            DetailsRow(
                details: AppStrings.sellerLogo,
                child: CustomContainer(
                  height: 26,
                  width: 100,
                  color: AppColors.white,
                  child: CustomImageView(
                    url: sellerImage,
                  ),
                )),
            SizedBox(
              height: 4.h,
            ),
            DetailsRow(
                details: AppStrings.sellerString,
                child: Text(
                  sellerName,
                  style: AppTextStyle.cairoSemiBold16,
                )),
            SizedBox(
              height: 4.h,
            ),
            DetailsRow(
                details: AppStrings.detailsString,
                child: SizedBox(
                  height: 100.h,
                  width: 300.w,
                  child: Text(
                    details.replaceAll(exp, ""),
                    style: AppTextStyle.cairoSemiBold16,
                    overflow: TextOverflow.ellipsis,
                    textAlign: context.isRTL?TextAlign.start:TextAlign.end,
                    maxLines: 3,
                  ),
                )),
            SizedBox(
              height: 11.h,
            ),
            Text(
              AppStrings.suggestProduct,
              style: AppTextStyle.cairoBold16White,
            ),
            SizedBox(
              height: 11.h,
            ),
            SuggestProduct(
                details: details, strokedPrice: discount, price: "price", hasDiscount: hasDiscount,),
            SizedBox(
              height: 8.h,
            ),
            SuggestProduct(
                details: details, strokedPrice: discount, price: "price", hasDiscount: hasDiscount,),
            SizedBox(height: 19.h),
            Row(
              children: [
                Container(
                  height: 103.h,
                  width: 190.w,
                  color: AppColors.red3,
                  child: Center(
                      child: Text(
                    "Buy Now",
                    style: AppTextStyle.cairoBold32White,
                    textAlign: TextAlign.center,
                  )),
                ),
                Container(
                  height: 103.h,
                  width: 190.w,
                  color: AppColors.yellow,
                  child: Center(
                      child: Text(
                    "Add",
                    style: AppTextStyle.cairoBold32White,
                    textAlign: TextAlign.center,
                  )),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String details;
  final Widget child;

  const DetailsRow({super.key, required this.details, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$details : ",
          style: AppTextStyle.cairoSemiBold16,
        ),
        child
      ],
    );
  }
}
