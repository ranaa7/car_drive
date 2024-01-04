import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomReloadFooter extends StatelessWidget {
  const CustomReloadFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Lottie.asset(Assets.imagesCarLoading,fit: BoxFit.fitHeight,);
        } else if (mode == LoadStatus.loading) {
          body =  Lottie.asset(Assets.imagesCarLoading,fit: BoxFit.fitHeight,);
        } else if (mode == LoadStatus.failed) {
          body = const Text("Load Failed!Click retry!");
        } else if (mode == LoadStatus.canLoading) {
          body = const Text("release to load more");
        } else {
          body = const Text("No more Data");
        }
        return SizedBox(
          height: 70.0.h,
          child: OverflowBox(
            minHeight:  200.0.h,
            maxHeight:  200.0.h,
              child: body),
        );
      },
    );
  }
}
