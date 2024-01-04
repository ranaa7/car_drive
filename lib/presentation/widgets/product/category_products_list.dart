import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/domain/models/product_model/all_produts_model.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_list_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class CategoryProductList extends StatelessWidget {
  final bool isLoading;
  final List<AllProductModel> products;

  const CategoryProductList(
      {super.key, required this.isLoading, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: AppShadows.shadow3),
      height: 300.h,
      width: double.infinity,
      child: products.isEmpty || isLoading
          ? const ProductListShimmer()
          : ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  final productCubit = ProductCubit.get(context);
                  WishlistCubit.get(context).checkIfProductIsInWishlist(products[index].id);
                  productCubit.getDetailsOfProduct(products[index].id);
                  productCubit.getRelatedProductsOfProduct(products[index].id);
                  Navigator.pushReplacementNamed(
                      context,
                      RouteName.productScreen);
                },
                child: ProductItem(
                  discount: products[index].discount ?? "",
                  strokedPrice: products[index].strokedPrice ?? "",
                  price: products[index].mainPrice ?? "",
                  details: products[index].name ?? "",
                  image: products.isEmpty
                      ? Assets.imagesEmpty
                      : products[index].thumbnailImage ?? "",
                  hasDiscount: products[index].hasDiscount ?? false,
                  imageHeight: 180,
                  imageWidth: 180,
                  containerHeight: 268,
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 18.w,
              ),
              itemCount: products.length,
            ),
    );
  }
}
