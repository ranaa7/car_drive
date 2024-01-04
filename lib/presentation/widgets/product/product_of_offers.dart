import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_list_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class ProductsOfOffers extends StatelessWidget {
  final bool isLoading;

  const ProductsOfOffers({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);

        final offerProducts = productCubit.productOfOffers;

        return Container(
          decoration: const BoxDecoration(boxShadow: AppShadows.shadow3),
          height: 300.h,
          width: double.infinity,
          child: offerProducts.isEmpty || isLoading
              ? const ProductListShimmer()
              : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                WishlistCubit.get(context).checkIfProductIsInWishlist(offerProducts[index].id);

                productCubit.quantity=1;
                productCubit
                    .getDetailsOfProduct(offerProducts[index].id);
                productCubit.getRelatedProductsOfProduct(
                    offerProducts[index].id);
                Navigator.pushReplacementNamed(
                    context,
                    RouteName.productScreen);
              },
              child: ProductItem(
                discount: offerProducts[index].discount ?? "",
                strokedPrice: offerProducts[index].strokedPrice ?? "",
                price: offerProducts[index].mainPrice ?? "",
                details: offerProducts[index].name ?? "",
                image: offerProducts.isEmpty
                    ? Assets.imagesEmpty
                    : offerProducts[index].thumbnailImage ?? "",
                hasDiscount: offerProducts[index].hasDiscount ?? false,
                imageHeight: 202,
                imageWidth: 180,
                containerHeight: 268,
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(
                  width: 18.w,
                ),
            itemCount: offerProducts.length,
          ),
        );
      },
    );
  }
}
