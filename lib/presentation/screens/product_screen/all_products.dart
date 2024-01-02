import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  int page = 1;

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
            isLoading
                ? const CategoriesShimmer()
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
                            Navigator.pushNamed(
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
