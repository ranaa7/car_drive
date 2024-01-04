import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/components/custom_expandable_description.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/increament_decreament.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/presentation/widgets/product/related_products.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class ProductDetails extends StatelessWidget {
  final int productId;

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
  final int rate;
  final VoidCallback minusPressed;
  final VoidCallback plusPressed;

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
      this.productCount = 1,
      required this.hasDiscount,
      required this.rate,
      required this.productId, required this.minusPressed, required this.plusPressed});

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
        hasDiscount
            ? Text(
                discount,
                style: AppTextStyle.cairoSemiBold14LineThroughWhite,
              )
            : SizedBox(
                height: 5.h,
              ),
        SizedBox(
          height: 2.h,
        ),
        RatingBarIndicator(
          rating: rate.toDouble(),
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 50.0,
          direction: Axis.horizontal,
        ),
        SizedBox(
          height: 11.h,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "(${"${AppStrings.availableProduct} " "$availableProduct"})",
                style: AppTextStyle.cairoMedium16White,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: IncreamentDecreament(
                counter: productCount,
                minusPressed: minusPressed,
                plusPressed: plusPressed,
              ),
            ),
            const Spacer()
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
                  height: 30,
                  width: 70,
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
                child: ExpandableWidget(
                  description: details,
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
            const RelatedProductsList(
            ),
            SizedBox(height: 19.h),
            Row(
              children: [
                Button1(
                  color: AppColors.red3,
                  height: 80,
                  width: 190,
                  onPressed: () {
                    if (availableProduct==0) {
                      Toasters.show(AppStrings.noAvailableProduct);
                    }else {
                      CartCubit.get(context).getCartList();
                      CartCubit.get(context).addCart(productId, productCount);
                    }
                  },
                  text: AppStrings.add,
                ),
                Button1(
                  color: AppColors.yellow,
                  height: 80,
                  width: 190,
                  text: AppStrings.buyNow,
                  onPressed: () {
                   if (availableProduct==0) {
                     Toasters.show(AppStrings.noAvailableProduct);
                   }else {
                     CartCubit.get(context).addCart(productId, productCount);
                     Navigator.pushReplacementNamed(context, RouteName.cartScreen);
                   }

                  }
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
