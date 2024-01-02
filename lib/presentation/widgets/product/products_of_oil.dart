import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/screens/product_screen/product_screen.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_list_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';

class ProductsOfOil extends StatelessWidget {
  final bool isLoading;

  const ProductsOfOil({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);

        final oilProducts = productCubit.productOfOils;

        return Container(
          decoration: const BoxDecoration(boxShadow: AppShadows.shadow3),
          height: 300.h,
          width: double.infinity,
          child: oilProducts.isEmpty || isLoading
              ? const ProductListShimmer()
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      productCubit.quantity = 1;
                      productCubit.getDetailsOfProduct(oilProducts[index].id);
                      productCubit
                          .getRelatedProductsOfProduct(oilProducts[index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                    isLoading: isLoading,
                                  )));
                    },
                    child: ProductItem(
                      discount: oilProducts[index].discount ?? "",
                      strokedPrice: oilProducts[index].strokedPrice ?? "",
                      price: oilProducts[index].mainPrice ?? "",
                      details: oilProducts[index].name ?? "",
                      image: oilProducts.isEmpty
                          ? Assets.imagesEmpty
                          : oilProducts[index].thumbnailImage ?? "",
                      hasDiscount: oilProducts[index].hasDiscount ?? false,
                      imageHeight: 202,
                      imageWidth: 180,
                      containerHeight: 268,
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 18.w,
                  ),
                  itemCount: oilProducts.length,
                ),
        );
      },
    );
  }
}
