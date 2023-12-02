import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class CustomOrderContainer extends StatelessWidget {
  final String image;
  final String orderNumber;
  final String orderDetails;
  final String orderDate;

  const CustomOrderContainer(
      {super.key,
      required this.image,
      required this.orderNumber,
      required this.orderDetails,
      required this.orderDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ImageContainer(image: image, height: 90, width: 90),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.orderNumber,
              style: AppTextStyle.cairoSemiBold12Black,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              AppStrings.orderDetails,
              style: AppTextStyle.cairoSemiBold12Grey,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              AppStrings.orderDate,
              style: AppTextStyle.cairoSemiBold12Black,
            ),
          ],
        )
      ]),
    );
  }
}
