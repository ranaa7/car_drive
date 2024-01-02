import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_circle_container.dart';
import 'package:more_2_drive/presentation/widgets/carousel/product_carousel.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class ProductSliverAppBar extends StatelessWidget {
  final String title;
  final int height;

  const ProductSliverAppBar({super.key, this.title = '', required this.height});

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
      backgroundColor:  AppColors.white,
      expandedHeight: 450.h,
      title: Row(
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
              style: AppTextStyle.cairoBold16Blue,
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
                  image: Assets.imagesCart,
                  imageHeight: 22,
                  imageWidth: 22,
                  containerWidth: 35,
                  containerHeight: 35,
                ),
                CustomCircleContainer(
                    image: Assets.imagesShare,
                    imageHeight: 22,
                    imageWidth: 22,
                    containerWidth: 35,
                    containerHeight: 35),
                CustomCircleContainer(
                    image: Assets.imagesLike,
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
        background: ProductCarousel(),
        title: const SizedBox(),
      ),
      pinned: true,
    );
  }
}
