import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ServicesRow extends StatelessWidget {
  const ServicesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServicesComponent(image: Assets.imagesInnerWash, service: AppStrings.innerWash),
        ServicesComponent(image: Assets.imagesOuterWash, service: AppStrings.outerWash),
        ServicesComponent(image: Assets.imagesFullWash, service: AppStrings.completeWash),
        ServicesComponent(image: Assets.imagesChangeFilter, service: AppStrings.changeFilter),
        ServicesComponent(image: Assets.imagesRecharge, service: AppStrings.recharge),
      ],
    );
  }
}
class ServicesComponent extends StatelessWidget {
  final String image;
  final String service;
  const ServicesComponent({super.key, required this.image, required this.service});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 45.w,
      child: Column(
        children: [
          Expanded(child: CustomImageView(imagePath: image,fit: BoxFit.cover,height: 25.h,width: 30.w)),
          FittedBox(child: Text(service,style: AppTextStyle.cairoBlack7Grey,))
        ],
      ),
    );
  }
}

