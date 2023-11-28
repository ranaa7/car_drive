import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(right:20.0.w),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [AppShadows.shadow3]),
        height: 300.h,
        width: double.infinity,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>  const Directionality(
              textDirection: TextDirection.ltr,
              child: ProductItem(
                discount: "Discount",
                price: "150",
                details: 'Details', image: Assets.imagesNew,
              )),
          separatorBuilder: (BuildContext context, int index) =>  SizedBox(
            width: 18.w,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
