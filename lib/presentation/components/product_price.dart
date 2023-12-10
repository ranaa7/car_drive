import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          context.isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          details,
          style: AppTextStyle.cairoThin13Grey,
          textAlign: context.isRTL ? TextAlign.end : TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        hasDiscount
            ? Text(
                strokedPrice,
                style: AppTextStyle.cairoSemiBold13LineThroughGrey,
              )
            : SizedBox(height: 30.h),
        Text(
          price,
          style: AppTextStyle.cairoBold17Red,
        ),
      ],
    );
  }
}
