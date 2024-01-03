import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_grid_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final productCubit = ProductCubit.get(context);
        final productDetails = productCubit.searchProducts;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0.w),
              child: Text(
                AppStrings.specialProduct,
                style: AppTextStyle.cairoSemiBold17Black,
              ),
            ),
            state is GetSearchProductLoadingState||productDetails.isEmpty
                ? const ProductGridShimmer()
                : GridView.count(
                padding: EdgeInsets.symmetric(
                    vertical: 50.0.h, horizontal: 10.w),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.7,
                    children: List.generate(
                        productDetails.length,
                        (index) => InkWell(
                          onTap: () {
                            ProductCubit.get(context).quantity=1;
                            ProductCubit.get(context).getDetailsOfProduct(
                                productDetails[index].id);
                            ProductCubit.get(context).getRelatedProductsOfProduct(productDetails[index].id);
                            Navigator.pushReplacementNamed(
                                context, RouteName.productScreen);
                          },
                          child: ProductItem(
                            details: productDetails[index].name ?? '',
                            price: productDetails[index].mainPrice ?? '',
                            image: productDetails[index].thumbnailImage ??
                                '',
                            discount:
                                productDetails[index].discount ?? '',
                            hasDiscount:
                                productDetails[index].hasDiscount ??
                                    false,
                            strokedPrice:
                                productDetails[index].strokedPrice ?? '',
                            imageHeight: 230,
                            imageWidth: 250,
                            containerHeight: 330,
                          ),
                        ))),
          ],
        );
      },
    );
  }
}
