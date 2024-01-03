import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/components/custom_reload_footer.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_grid_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductOfBrandScreen extends StatefulWidget {
  final int id;
  const ProductOfBrandScreen({super.key, required this.id});

  @override
  State<ProductOfBrandScreen> createState() =>
      _ProductOfBrandScreenState();
}

class _ProductOfBrandScreenState extends State<ProductOfBrandScreen> {
  final RefreshController _refreshController = RefreshController();
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

  String searchValue = "";
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final TextEditingController searchController = TextEditingController();
        final productCubit = ProductCubit.get(context);
        final productDetails = productCubit.productOfBrand;
        final searchList = productDetails
            .where((e) => searchValue.isNotEmpty
            ? (e.name?.toLowerCase().contains(searchValue.toLowerCase()) ??
            false)
            : false)
            .toList();
        return Scaffold(
            appBar: DefaultAppBar(
              isSearch: true,
              searchController: searchController,
              onChanged: (v) {
                setState(() {
                  searchValue = v;
                });
              },
            ),
            body: SmartRefresher(
              footer:const CustomReloadFooter(),
              enablePullUp: true,
              onLoading: () async {
                await Future.delayed(const Duration(seconds: 1));
                productCubit.getProductOfBrand(id:widget.id,page: ++page);
                _refreshController.loadComplete();
              },
              onRefresh: () {
                setState(() {
                  isLoading = true;
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
              child: isLoading
                  ? const ProductGridShimmer()
                  : GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.5.h,
                  crossAxisSpacing: 0.5.w,
                  childAspectRatio: 0.7,
                  children: searchList.isNotEmpty
                      ? List.generate(
                      searchList.length,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0.h, horizontal: 5.w),
                        child: InkWell(
                          onTap: (){
                            ProductCubit.get(context).quantity=1;
                            productCubit
                                .getRelatedProductsOfProduct(
                                searchList[index].id);
                            ProductCubit.get(context).getDetailsOfProduct(
                                searchList[index].id);
                            Navigator.pushNamed(context, RouteName.productScreen);
                          },
                          child: ProductItem(
                            details: searchList[index].name ?? '',
                            price: searchList[index].mainPrice ?? '',
                            image: searchList[index].thumbnailImage ??
                                '',
                            discount:
                            searchList[index].discount ?? '',
                            hasDiscount:
                            searchList[index].hasDiscount ??
                                false,
                            strokedPrice:
                            searchList[index].strokedPrice ?? '',
                            imageHeight: 200,
                            imageWidth: 200,
                            containerHeight: 350,
                          ),
                        ),
                      ))
                      : List.generate(
                      productDetails.length,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0.h, horizontal: 5.w),
                        child: InkWell(
                          onTap: (){
                            ProductCubit.get(context).quantity=1;
                            productCubit
                                .getRelatedProductsOfProduct(
                                productDetails[index].id);
                            ProductCubit.get(context).getDetailsOfProduct(
                                productDetails[index].id);
                            Navigator.pushNamed(context, RouteName.productScreen);
                          },
                          child: ProductItem(
                            details: productDetails[index].name ?? '',
                            price:
                            productDetails[index].mainPrice ?? '',
                            image: productDetails[index]
                                .thumbnailImage ??
                                '',
                            discount:
                            productDetails[index].discount ?? '',
                            hasDiscount:
                            productDetails[index].hasDiscount ??
                                false,
                            strokedPrice:
                            productDetails[index].strokedPrice ??
                                '',
                            imageHeight: 220,
                            imageWidth: 250,
                            containerHeight: 330,
                          ),
                        ),
                      ))),
            ));
      },
    );
  }
}
