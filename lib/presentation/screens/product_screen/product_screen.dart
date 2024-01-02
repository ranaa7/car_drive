import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/product_sliver_appbar.dart';
import 'package:more_2_drive/presentation/widgets/product/product_details.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class ProductScreen extends StatelessWidget {
  final bool isLoading;

  const ProductScreen({super.key, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);
        final detailsOfProducts = productCubit.detailsOfProducts;
        return Scaffold(
            extendBody: false,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                ProductSliverAppBar(
                  height: 60,
                  title: detailsOfProducts.isEmpty
                      ? ""
                      : detailsOfProducts[0].name ?? "",
                )
              ],
              body: Container(
                margin: EdgeInsets.only(top: 17.h),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xff1b4e89), Color(0xff0e396b)],
                    )),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
                  children: [
                    detailsOfProducts.isEmpty
                        ? const CategoriesShimmer()
                        : ProductDetails(
                            productCount: productCubit.quantity,
                            productName: detailsOfProducts[0].name ?? "",
                            productPrice: detailsOfProducts[0].mainPrice ?? "",
                            discount: detailsOfProducts[0].strokedPrice ?? "",
                            availableProduct:
                                detailsOfProducts[0].currentStock ?? 0,
                            pointsString: AppStrings.pointsString,
                            pointsNumber: detailsOfProducts[0].earnPoint ?? 0,
                            sellerLogo: detailsOfProducts[0].shopLogo ?? "",
                            sellerString: AppStrings.sellerString,
                            sellerName: detailsOfProducts[0].shopName ?? "",
                            detailsString: AppStrings.detailsString,
                            details: detailsOfProducts[0].description ?? "",
                            sellerImage: detailsOfProducts[0].shopLogo ?? "",
                            hasDiscount:
                                detailsOfProducts[0].hasDiscount ?? false,
                            rate: detailsOfProducts[0].ratingCount ?? 0,
                            isLoading: isLoading,
                            productId: detailsOfProducts[0].id ?? 1,
                            minusPressed: () => productCubit.minusPressed(0),
                            plusPressed: () => productCubit.plusPressed(0),
                          )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
