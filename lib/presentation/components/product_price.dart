import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class ProductPrice extends StatelessWidget {
  final String details;
  final String strokedPrice;
  final String price;
  final bool hasDiscount;

  const ProductPrice(
      {super.key,
      required this.details,
      required this.strokedPrice,
      required this.price,
      required this.hasDiscount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          details,
          style: AppTextStyle.cairoMedium14Black,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        hasDiscount
            ? Text(
                strokedPrice,
                style: AppTextStyle.cairoSemiBold13LineThroughGrey.copyWith(height: 1.2.h),
              )
            : SizedBox(height: 20.h),
        Text(
          price,
          style: AppTextStyle.cairoBold17Red,
        ),
      ],
    );
  }
}
