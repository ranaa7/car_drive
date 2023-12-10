import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSearch ;
  final TextEditingController? searchController;
  final onChanged;

  const DefaultAppBar({super.key, this.title = '',this.isSearch =false,  this.searchController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: isSearch? Container(
        width: 420.w,
        color: AppColors.white,
        child: TextFormField(
          onChanged: onChanged,
          style: AppTextStyle.cairoSemiBold17Black,
          cursorColor: AppColors.grey4,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child:Icon(Icons.search),
            ),
          ),
      )):
      Row(
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 99.h);
}
// Row(
// children: [
// Text(
// AppStrings.search,
// style: AppTextStyle.cairoMedium14Black,
// ),
// const Spacer(),
// const Icon(Icons.search),
// ],
// ),