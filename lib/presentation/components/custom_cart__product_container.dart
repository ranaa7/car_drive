import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/increament_decreament.dart';

class CartProductContainer extends StatelessWidget {
  final bool isPickup;
  final String productImage;
  final String name;
  final int price;
  final String currency;
  final dynamic onPressed;
  final int? productQuantity;
  final VoidCallback? minusPressed;
  final VoidCallback? plusPressed;

  const CartProductContainer(
      {super.key,
      required this.productImage,
      required this.name,
      required this.price,
      required this.currency,
      required this.onPressed,
      this.productQuantity,
      this.minusPressed,
      this.plusPressed, this.isPickup= false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      width: 400.w,
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: AppShadows.shadow3,
          color: AppColors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CustomImageView(
              url: productImage,
              height: 135.h,
              width: 135.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.h),
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                        width: 180.w,
                        child: Text(
                          name,
                          style: AppTextStyle.cairoMedium14Grey,
                          overflow: TextOverflow.ellipsis,
                        ))),
                Text(
                  "$price$currency",
                  style: AppTextStyle.cairoBold17Red,
                )
              ],
            ),
          ),
          isPickup?SizedBox():Expanded(
              child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0.h),
              child: const Icon(
                Icons.delete_outline,
                color: AppColors.red,
              ),
            ),
          )),
          isPickup?SizedBox():Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 10.w),
            child: IncreamentDecreament(
              isHorizontal: false,
              minusPressed: minusPressed,
              plusPressed: plusPressed,
              counter: productQuantity,
            ),
          )
        ],
      ),
    );
  }
}
