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

class ProductsOfBattery extends StatelessWidget {
  final bool isLoading;

  const ProductsOfBattery({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);

        final batteryProducts = productCubit.productOfBatteries;

        return Container(
          decoration: const BoxDecoration(boxShadow: AppShadows.shadow3),
          height: 300.h,
          width: double.infinity,
          child: batteryProducts.isEmpty || isLoading
              ? const ProductListShimmer()
              : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.w),

            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                WishlistCubit.get(context).checkIfProductIsInWishlist(batteryProducts[index].id);

                productCubit.quantity=1;
                productCubit
                    .getDetailsOfProduct(batteryProducts[index].id);
                productCubit.getRelatedProductsOfProduct(
                    batteryProducts[index].id);
                Navigator.pushReplacementNamed(
                    context,
                    RouteName.productScreen);
              },
              child: ProductItem(
                discount: batteryProducts[index].discount ?? "",
                strokedPrice: batteryProducts[index].strokedPrice ?? "",
                price: batteryProducts[index].mainPrice ?? "",
                details: batteryProducts[index].name ?? "",
                image: batteryProducts.isEmpty
                    ? Assets.imagesEmpty
                    : batteryProducts[index].thumbnailImage ?? "",
                hasDiscount: batteryProducts[index].hasDiscount ?? false,
                imageHeight: 202,
                imageWidth: 180,
                containerHeight: 268,
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(
                  width: 18.w,
                ),
            itemCount: batteryProducts.length,
          ),
        );
      },
    );
  }
}
