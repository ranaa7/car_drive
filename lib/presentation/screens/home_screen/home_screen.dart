// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/components/custom_order_container.dart';
import 'package:more_2_drive/presentation/components/custom_reload_footer.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/screens/product_screen/all_products.dart';
import 'package:more_2_drive/presentation/widgets/brands/all_brands.dart';
import 'package:more_2_drive/presentation/widgets/categories/categories_banner.dart';
import 'package:more_2_drive/presentation/widgets/categories_gridview/categories_gridview.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/home_sliver_appbar.dart';
import 'package:more_2_drive/presentation/widgets/product/category_products_list.dart';
import 'package:more_2_drive/presentation/widgets/product/product_of_offers.dart';
import 'package:more_2_drive/presentation/widgets/product/products_of_battery.dart';
import 'package:more_2_drive/presentation/widgets/product/feature_products_list.dart';
import 'package:more_2_drive/presentation/widgets/product/products_of_oil.dart';
import 'package:more_2_drive/presentation/widgets/special_product/special_product.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  final RefreshController _refreshController = RefreshController();
  int page = 1;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (mounted) {
        setState(() {
          isLoading = false;
          CartCubit.get(context).getCartCount();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = ProductCubit.get(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          const DefaultSliverAppBar(
            isHome: true,
            height: 110,
          )
        ],
        body: SmartRefresher(
          footer: const CustomReloadFooter(),
          enablePullUp: true,
          onLoading: () async {
            await Future.delayed(const Duration(seconds: 1));
            productCubit.getSearchProduct(page: ++page);
            _refreshController.loadComplete();
          },
          onRefresh: () {
            setState(() {
              isLoading = true;
              productCubit.getSearchProduct(page: 1);
              CartCubit.get(context).getCartCount();
              productCubit.getProductsOfOilCategory();
              productCubit.getProductsOfOfferCategory();
              productCubit.getProductsOfBatteryCategory();
              Future.delayed(const Duration(seconds: 2)).then((_) {
                if (mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              });
              _refreshController.refreshCompleted();
            });
          },
          controller: _refreshController,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 35.h,
              ),
              CustomOrderContainer(
                image: Assets.imagesBanner,
                orderNumber: "orderNumber",
                orderDetails: "orderDetails",
                orderDate: "orderDate",
                isLoading: isLoading,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomImageView(
                imagePath: Assets.imagesNew,
                fit: BoxFit.cover,
              ),
              CategoriesGridView(
                isLoading: isLoading,
              ),
              FeaturedProduct(isLoading: isLoading),
              SizedBox(
                height: 4.h,
              ),
              const CategoriesBanner(index: 2),
              SizedBox(
                height: 15.h,
              ),
           ProductsOfOffers(isLoading: isLoading),
              SizedBox(
                height: 15.h,
              ),
              const CategoriesBanner(index: 1),
              SizedBox(
                height: 15.h,
              ),
              ProductsOfOil(isLoading: isLoading),
              SizedBox(
                height: 15.h,
              ),
              const CategoriesBanner(index: 0),
              SizedBox(
                height: 15.h,
              ),
              ProductsOfBattery(isLoading: isLoading),
              SizedBox(
                height: 40.h,
              ),
              const AllBrands(),
              SizedBox(
                height: 24.h,
              ),
              const AllProducts()
            ],
          ),
        ),
      ),
    );
  }
}
