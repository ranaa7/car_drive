import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/screens/product_screen/product_screen.dart';
import 'package:more_2_drive/presentation/widgets/product/suggest_product.dart';

class RelatedProductsList extends StatelessWidget {
  final bool isLoading;

   const RelatedProductsList({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final ProductCubit productCubit = ProductCubit.get(context);
        final relatedProducts = productCubit.relatedProductsOfProduct;
        return SizedBox(
          height: 235.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => relatedProducts.isNotEmpty?InkWell(
                onTap: (){
                  ProductCubit.get(context).quantity=1;
                  productCubit.getDetailsOfProduct(
                      relatedProducts[index].id);
                  productCubit.getRelatedProductsOfProduct(relatedProducts[index].id);
                  print(relatedProducts[index].id.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(isLoading: isLoading,)));
                },
                child: SuggestProduct(
                    details: relatedProducts[index].name ?? '',
                    strokedPrice: relatedProducts[index].strokedPrice ?? '',
                    price: relatedProducts[index].mainPrice ?? '',
                    hasDiscount: relatedProducts[index].hasDiscount ?? false, image: relatedProducts[index].thumbnailImage??'',),
              ):Container(color: Colors.red,height: 150.h,),
              separatorBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
              itemCount: relatedProducts.length),
        );
      },
    );
  }
}
