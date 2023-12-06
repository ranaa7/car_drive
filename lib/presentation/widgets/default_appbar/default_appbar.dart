import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: 19.0.h, horizontal: 26.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // const CustomCircleContainer(image: Assets.svgLike, imageHeight: 22, imageWidth: 22, containerWidth: 35, containerHeight: 35),
            // const CustomCircleContainer(image: Assets.svgShare, imageHeight: 22, imageWidth: 22, containerWidth: 35, containerHeight: 35),
            // const CustomCircleContainer(image: Assets.svgShoppingCart, imageHeight: 22, imageWidth: 22, containerWidth: 35, containerHeight: 35,),
            // const Spacer(),
            Text(
              title,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.cairoMedium16Blue,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context, RouteName.mainScreen);
              },
            ),

          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 99.h);
}
