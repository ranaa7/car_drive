import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/components/custom_container.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/custom_app_shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  final bool isHome;
  const CategoriesShimmer({super.key, this.isHome=false});

  @override
  Widget build(BuildContext context) {
    return CustomAppShimmer(
        width: 0,
        height: 0,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical:isHome? 15.h:200.h,horizontal: 10.w),
          physics: const NeverScrollableScrollPhysics(),
            itemCount: isHome?4:8,
            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.h,
              maxCrossAxisExtent: 400,
              childAspectRatio: 1.8,
            ),
            itemBuilder: (context, index) => const CustomContainer(
              color: Colors.white, height: 141, width: 209,
                child: SizedBox())));
  }
}
