import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/custom_order_container.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:more_2_drive/presentation/widgets/categories_gridview/categories_gridview.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/sliver_appbar.dart';
import 'package:more_2_drive/presentation/widgets/product/product_list.dart';
import 'package:more_2_drive/presentation/widgets/special_product/special_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const DefaultAppBar(),
      body: NestedScrollView(
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) => [
          const DefaultSliverAppBar(
            isHome: true,
            height: 85,
          )
        ],
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 35.h,
            ),
            const CustomOrderContainer(
                image: Assets.imagesBanner,
                orderNumber: "orderNumber",
                orderDetails: "orderDetails",
                orderDate: "orderDate"),
            SizedBox(
              height: 4.h,
            ),
            CustomImageView(
              imagePath: Assets.imagesNew,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 4.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                return const CategoriesGridView();
              },
            ),
            SizedBox(
              height: 4.h,
            ),
            const FeaturedProduct(),
            SizedBox(
              height: 4.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return CustomImageView(
                  height: 157.h,
                  url: topCategory[2].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            const ProductList(),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return CustomImageView(
                  height: 157.h,
                  url: topCategory[1].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            const ProductList(),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return CustomImageView(
                  height: 157.h,
                  url: topCategory[0].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            const ProductList(),
          ],
        ),
      ),
    );
  }
}
