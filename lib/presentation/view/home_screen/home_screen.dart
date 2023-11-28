import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/widgets/carousel/banner_carousel.dart';
import 'package:more_2_drive/presentation/widgets/categories_gridview/categories_gridview.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/product/product_list.dart';
import 'package:more_2_drive/presentation/widgets/special_product/special_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(),
        extendBodyBehindAppBar: false,
        body: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            const BannerCarousel(),
            SizedBox(height: 4.h,),
            CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,),
            SizedBox(height: 4.h,),
            const CategoriesGridView(),
            SizedBox(height: 4.h,),
             const SpecialProduct(),
            SizedBox(height: 4.h,),
            CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,),
            SizedBox(height: 15.h,),
            const ProductList(),
            SizedBox(height: 15.h,),
            CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,),
            SizedBox(height: 15.h,),
            const ProductList(),
            SizedBox(height: 15.h,),
            CustomImageView(imagePath: Assets.imagesNew,fit: BoxFit.cover,),
            SizedBox(height: 15.h,),
            const ProductList(),



          ],
        ),
      ),
    );
  }
}
