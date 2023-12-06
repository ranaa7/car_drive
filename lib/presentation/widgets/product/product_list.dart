import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/screens/product_screen/product_screen.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);

        final  featuredProducts = productCubit.featuredProduct;
        return Padding(
          padding: context.isRTL ? EdgeInsets.only(right: 17.0.w) : EdgeInsets
              .only(left: 17.0.w),
          child: Container(
            decoration: const BoxDecoration(
                boxShadow: [AppShadows.shadow3]),
            height: 300.h,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
               Directionality(
                  textDirection: TextDirection.ltr,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:  (context) => ProductScreen(  featuredProductDetails: featuredProducts[index],)) );
                    },
                    child: ProductItem(
                      discount: featuredProducts[index].discount??"",
                      strokedPrice: featuredProducts[index].strokedPrice??"",
                      price: featuredProducts[index].mainPrice??"",
                      details: featuredProducts[index].name??"", image: featuredProducts.isEmpty?Assets.imagesEmpty:featuredProducts[index].thumbnailImage??"", hasDiscount: featuredProducts[index].hasDiscount??false,
                    ),
                  )),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(
                    width: 18.w,
                  ),
              itemCount: featuredProducts.length,
            ),
          ),
        );
      },
    );
  }
}
