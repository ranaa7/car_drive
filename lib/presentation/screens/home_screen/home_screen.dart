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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
             CustomOrderContainer(
                image: Assets.imagesBanner,
                orderNumber: "orderNumber",
                orderDetails: "orderDetails",
                orderDate: "orderDate", isLoading: isLoading,),
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
            CategoriesGridView(isLoading: isLoading,),
            SizedBox(
              height: 4.h,
            ),
             FeaturedProduct(isLoading: isLoading,),
            SizedBox(
              height: 4.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return topCategory.isEmpty?CustomImageView(
                  height: 157.h,
                  imagePath: Assets.imagesEmpty,
                  fit: BoxFit.cover,
                ):CustomImageView(
                  height: 157.h,
                  url: topCategory[2].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
             ProductList(isLoading: isLoading,),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return topCategory.isEmpty?CustomImageView(
                  height: 157.h,
                  imagePath: Assets.imagesEmpty,
                  fit: BoxFit.cover,
                ):CustomImageView(
                  height: 157.h,
                  url: topCategory[1].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
             ProductList(isLoading: isLoading,),
            SizedBox(
              height: 15.h,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                final CategoriesCubit topCategories = CategoriesCubit.get(context);

                final  topCategory = topCategories.topCategory;
                return topCategory.isEmpty?CustomImageView(
                  height: 157.h,
                  imagePath: Assets.imagesEmpty,
                  fit: BoxFit.cover,
                ):CustomImageView(
                  height: 157.h,
                  url: topCategory[0].banner,
                  fit: BoxFit.cover,
                );
              },
            ),
            SizedBox(
              height: 15.h,
            ),
             ProductList(isLoading: isLoading,),
          ],
        ),
      ),
    );
  }
}
