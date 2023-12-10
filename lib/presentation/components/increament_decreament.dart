import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_circle_container.dart';

class IncreamentDecreament extends StatelessWidget {
  final String counter;
  const IncreamentDecreament({super.key,  this.counter="1"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCircleContainer(image: Assets.svgMinus2, imageHeight: 23, imageWidth: 23, containerWidth: 33, containerHeight: 33),
        SizedBox(width: 17.w,),
        Text(counter,style: AppTextStyle.cairoMedium36White,),
        SizedBox(width: 17.w,),
        const CustomCircleContainer(image: Assets.svgPlus, imageHeight: 23, imageWidth: 23, containerWidth: 33, containerHeight: 33),

      ],
    );
  }
}
