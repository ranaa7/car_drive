import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';

class BrandsItem extends StatelessWidget {
  final String logo;
  const BrandsItem({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AppColors.white),
      child: FittedBox(
          child: CustomImageView(
            url: logo ,
            height: 150.h,
            width: 150.h,
          )),
    );
  }
}
