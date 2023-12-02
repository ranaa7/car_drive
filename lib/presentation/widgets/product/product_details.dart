import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/increament_decreament.dart';
import 'package:more_2_drive/presentation/widgets/suggest_product/suggest_product.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String discount;
  final String availableProduct;
  final String pointsString;
  final String pointsNumber;
  final String sellerLogo;
  final String sellerString;
  final String sellerName;
  final String sellerImage;
  final String detailsString;
  final String details;

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
      required this.sellerImage});

  @override
  Widget build(BuildContext context) {
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
            height: 52,
            width: 270,
            color: AppColors.red3,
            child: FittedBox(child: Text(productPrice, style: AppTextStyle.cairoBlack48White,textAlign: TextAlign.center,))),
        SizedBox(height: 3.h),
        Text(
          discount,
          style: AppTextStyle.cairoSemiBold14LineThroughWhite,
        ),
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
              "($availableProduct)",
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
                    pointsString,
                    style: AppTextStyle.cairoBold15White,
                  ),
                  Text(
                    pointsNumber,
                    style: AppTextStyle.cairoBold15White,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            DetailsRow(
                details: sellerLogo,
                child: CustomContainer(
                  height: 26,
                  width: 100,
                  color: AppColors.white,
                  child: CustomImageView(
                    imagePath: sellerImage,
                  ),
                )),
            SizedBox(
              height: 4.h,
            ),
            DetailsRow(
                details: sellerString,
                child: Text(
                  sellerName,
                  style: AppTextStyle.cairoSemiBold16,
                )),
            SizedBox(
              height: 4.h,
            ),
            DetailsRow(
                details: detailsString,
                child: Text(
                  details,
                  style: AppTextStyle.cairoSemiBold16,
                )),
            SizedBox(height: 11.h,),
            Text(
              "suggestProduct",
              style: AppTextStyle.cairoMedium16White,
            ),
            SizedBox(height: 11.h,),
            SuggestProduct(details: details, discount: discount, price: "price"),
            SizedBox(height: 8.h,),
            SuggestProduct(details: details, discount: discount, price: "price"),
            SizedBox(height:19.h),
            Row(
              children: [
              CustomContainer(height: 103, width: 190,color: AppColors.red3,child: Center(child: Text("Buy Now",style: AppTextStyle.cairoBold32White,textAlign: TextAlign.center,)),),
              CustomContainer(height: 103, width: 190,color: AppColors.yellow,child: Center(child: Text("Add",style: AppTextStyle.cairoBold32White,textAlign: TextAlign.center,)),),
            ],)
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
