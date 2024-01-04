import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_circle_container.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_state.dart';
import 'package:more_2_drive/presentation/widgets/carousel/product_carousel.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_details_shimmer.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class ProductSliverAppBar extends StatelessWidget {
  final String title;
  final int height;
  final int productId;

  const ProductSliverAppBar(
      {super.key,
      this.title = '',
      required this.height,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);
        final detailsOfProducts = productCubit.detailsOfProducts;
        return SliverAppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          )),
          collapsedHeight: height.h,
          backgroundColor: AppColors.white,
          expandedHeight: 450.h,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.blue,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, RouteName.mainScreen);
                },
              ),
              SizedBox(
                width: 12.w,
              ),
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
              Expanded(
                child: state is CheckIfProductInWishlistLoadingState ||
                        detailsOfProducts.isEmpty
                    ? const AppBarShimmer()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, RouteName.cartScreen),
                            child: const CustomCircleContainer(
                              image: Assets.imagesCart,
                              imageHeight: 22,
                              imageWidth: 22,
                              containerWidth: 35,
                              containerHeight: 35,
                            ),
                          ),
                          const CustomCircleContainer(
                              image: Assets.imagesShare,
                              imageHeight: 22,
                              imageWidth: 22,
                              containerWidth: 35,
                              containerHeight: 35),
                          IconButton(
                              onPressed: () {
                                if (WishlistCubit.get(context)
                                        .addResponseModel
                                        ?.isInWishlist ==
                                    false) {
                                  WishlistCubit.get(context)
                                      .addProductToWishlist(productId);
                                } else if (WishlistCubit.get(context)
                                        .addResponseModel
                                        ?.isInWishlist ==
                                    true) {
                                  WishlistCubit.get(context).removeProductFromWishlist(productId);
                                  Toasters.show("Product removed");
                                }
                              },
                              icon: WishlistCubit.get(context)
                                          .addResponseModel
                                          ?.isInWishlist ==
                                      false
                                  ? const Icon(
                                      Icons.favorite,
                                      color: AppColors.black,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: AppColors.red,
                                    )),
                        ],
                      ),
              ),
            ],
          ),
          flexibleSpace: const FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            expandedTitleScale: 1,
            centerTitle: true,
            background: ProductCarousel(),
            title: SizedBox(),
          ),
          pinned: true,
        );
      },
    );
  }
}
