import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_circle_container.dart';
import 'package:more_2_drive/presentation/widgets/carousel/banner_carousel.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class DefaultSliverAppBar extends StatelessWidget {
  final bool isHome;
  final String title;
  final int height;

  const DefaultSliverAppBar({super.key, this.isHome = false, this.title = '', required this.height});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(40),
      )),
      collapsedHeight: height.h,
      backgroundColor: isHome ? AppColors.red2 : AppColors.white,
      expandedHeight: 420.h,
      title: isHome
          ? const SizedBox()
          : Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.blue,
                  ),
                  onPressed: () {
                    Navigator.pop(context, RouteName.mainScreen);
                  },
                ),
                SizedBox(width: 12.w,),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    title,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.cairoMedium16Blue,
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCircleContainer(
                      image: Assets.svgShoppingCart,
                      imageHeight: 22,
                      imageWidth: 22,
                      containerWidth: 35,
                      containerHeight: 35,
                    ),
                      CustomCircleContainer(
                          image: Assets.svgShare,
                          imageHeight: 22,
                          imageWidth: 22,
                          containerWidth: 35,
                          containerHeight: 35),
                      CustomCircleContainer(
                          image: Assets.svgLike,
                          imageHeight: 22,
                          imageWidth: 22,
                          containerWidth: 35,
                          containerHeight: 35),
                    ],
                  ),
                ),



              ],
            ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1,
        centerTitle: true,
        background: BannerCarousel(
          isHome: isHome,
        ),
        title: isHome
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.searchForAllNeeds,
                    style: AppTextStyle.cairoSemiBold16,
                  ),
                  InkWell(
                    child: Container(
                      width: 334.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.greyTransparent,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.0.w,
                        ),
                        child: Row(
                          children: [
                            Text(
                              AppStrings.search,
                              style: AppTextStyle.cairoMedium14Black,
                            ),
                            const Spacer(),
                            const Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : const SizedBox(),
      ),
      pinned: true,
    );
  }
}
