import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
        width: 0,
        height: 0,
        child: SizedBox(
          height: 320.h,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.h,
                maxCrossAxisExtent: 400,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) => const ImageContainer(
                  image: Assets.imagesEmpty, height: 141, width: 209)),
        ));
  }
}
