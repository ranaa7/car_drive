import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        final productDetails = ProductCubit.get(context).searchProducts;
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
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SpinKitPouringHourGlassRefined(
                          color: AppColors.black,
                        ),
                        Text(
                          AppStrings.loadMoreProduct,
                          style: AppTextStyle.cairoSemiBold17Black,
                        ),
                      ],
                    );
                  } else if (mode == LoadStatus.loading) {
                    body = Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SpinKitPouringHourGlassRefined(
                          color: AppColors.black,
                        ),
                        Text(
                          AppStrings.loadMoreProduct,
                          style: AppTextStyle.cairoSemiBold17Black,
                        ),
                      ],
                    );
                  } else if (mode == LoadStatus.failed) {
                    body = const Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = const Text("release to load more");
                  } else {
                    body = const Text("No more Data");
                  }
                  return SizedBox(
                    height: 55.0.h,
                    child: Center(child: body),
                  );
                },
              ),
              enablePullUp: true,
              onLoading: () async {
                await Future.delayed(const Duration(seconds: 1));
                productCubit.getSearchProduct(++page);
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
                  ? const CategoriesShimmer()
                  : ListView(
                      children: [
                        Container(
                          width: 420.w,
                          color: Colors.black,
                          child: StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 4.h,
                              crossAxisSpacing: 4.w,
                              children: searchList.isNotEmpty
                                  ? List.generate(
                                      searchList.length,
                                      (index) => StaggeredGridTile.count(
                                            crossAxisCellCount: 2,
                                            mainAxisCellCount: 2,
                                            child: ProductItem(
                                              details:
                                                  searchList[index].name ?? '',
                                              price:
                                                  searchList[index].mainPrice ??
                                                      '',
                                              image: searchList[index]
                                                      .thumbnailImage ??
                                                  '',
                                              discount:
                                                  searchList[index].discount ??
                                                      '',
                                              hasDiscount: searchList[index]
                                                      .hasDiscount ??
                                                  false,
                                              strokedPrice: searchList[index]
                                                      .strokedPrice ??
                                                  '',
                                              imageHeight: 250,
                                              imageWidth: 250,
                                              containerHeight: 350,
                                            ),
                                          ))
                                  : List.generate(
                                      productDetails.length,
                                      (index) => ProductItem(
                                            details:
                                                productDetails[index].name ??
                                                    '',
                                            price: productDetails[index]
                                                    .mainPrice ??
                                                '',
                                            image: productDetails[index]
                                                    .thumbnailImage ??
                                                '',
                                            discount: productDetails[index]
                                                    .discount ??
                                                '',
                                            hasDiscount: productDetails[index]
                                                    .hasDiscount ??
                                                false,
                                            strokedPrice: productDetails[index]
                                                    .strokedPrice ??
                                                '',
                                            imageHeight: 220,
                                            imageWidth: 250,
                                            containerHeight: 330,
                                          ))),
                        )
                      ],
                    ),
            ));
      },
    );
  }
}
