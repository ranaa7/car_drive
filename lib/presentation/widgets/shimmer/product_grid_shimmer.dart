import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 10.w),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.7,
        children: List.generate(
            20,
            (index) => CustomAppShimmer(
              width: 0.w,
              height: 0.h,
              child: const CustomContainer(
                color: Colors.white, height: 330,
                width: 150,
                child: SizedBox(),),
            ),
                ));
  }
}
