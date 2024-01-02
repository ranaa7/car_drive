import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/screens/product_screen/product_screen.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_list_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';

class FeaturedProductList extends StatelessWidget {
  final bool isLoading;

  const FeaturedProductList({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);

        final featuredProducts = productCubit.featuredProduct;

        return Container(
          height: 300.h,
          width: double.infinity,
          child: featuredProducts.isEmpty || isLoading
              ? const ProductListShimmer()
              : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      productCubit.quantity=1;
                      productCubit
                          .getDetailsOfProduct(featuredProducts[index].id);
                      productCubit.getRelatedProductsOfProduct(
                          featuredProducts[index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                    isLoading: isLoading,
                                  )));
                    },
                    child: ProductItem(
                      discount: featuredProducts[index].discount ?? "",
                      strokedPrice: featuredProducts[index].strokedPrice ?? "",
                      price: featuredProducts[index].mainPrice ?? "",
                      details: featuredProducts[index].name ?? "",
                      image: featuredProducts.isEmpty
                          ? Assets.imagesEmpty
                          : featuredProducts[index].thumbnailImage ?? "",
                      hasDiscount: featuredProducts[index].hasDiscount ?? false,
                      imageHeight: 180,
                      imageWidth: 180,
                      containerHeight: 268,
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 18.w,
                  ),
                  itemCount: featuredProducts.length,
                ),
        );
      },
    );
  }
}
