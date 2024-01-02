import 'package:flutter/material.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_circle_container.dart';

class IncreamentDecreament extends StatelessWidget {
  final int? counter;
  final bool isHorizontal;
  final VoidCallback? minusPressed;
  final VoidCallback? plusPressed;

  const IncreamentDecreament(
      {super.key,
      this.counter = 1,
      this.isHorizontal = true,
      required this.minusPressed,
      required this.plusPressed});

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: minusPressed,
                  child: const CustomCircleContainer(
                      image: Assets.imagesMinusWhite,
                      imageHeight: 23,
                      imageWidth: 23,
                      containerWidth: 33,
                      containerHeight: 33)),
              Text(
                "$counter",
                style: AppTextStyle.cairoMedium36White,
              ),
              InkWell(
                  onTap: plusPressed,
                  child: const CustomCircleContainer(
                      image: Assets.imagesPlusWhite,
                      imageHeight: 23,
                      imageWidth: 23,
                      containerWidth: 33,
                      containerHeight: 33)),
            ],
          )
        : Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: plusPressed,
                  child: const CustomCircleContainer(
                      image: Assets.imagesPlusBlue,
                      imageHeight: 23,
                      imageWidth: 23,
                      containerWidth: 33,
                      containerHeight: 33)),
              Text(
                "$counter",
                style: AppTextStyle.cairoSemiBold17Black,
              ),
              InkWell(
                  onTap: minusPressed,
                  child: const CustomCircleContainer(
                      image: Assets.imagesMinusBlue,
                      imageHeight: 23,
                      imageWidth: 23,
                      containerWidth: 33,
                      containerHeight: 33)),
            ],
          );
  }
}
