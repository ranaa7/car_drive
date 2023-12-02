import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/text_styles.dart';

class ProductPrice extends StatelessWidget {
  final String details;
  final String discount;
  final String price;
  const ProductPrice({super.key, required this.details, required this.discount, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: context.isRTL?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        Text(
          details,
          style: AppTextStyle.cairoThin11Grey,
        ),

        Text(
          discount,
          style: AppTextStyle.cairoSemiBold13LineThroughGrey,
        ),
        Text(
          price,
          style: AppTextStyle.cairoBold17Red,
        ),
      ],
    );
  }
}
