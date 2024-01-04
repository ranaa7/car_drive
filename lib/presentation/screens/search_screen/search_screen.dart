import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_reload_footer.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_state.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/brands/brands_item.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/filter/filter_drawer.dart';
import 'package:more_2_drive/presentation/widgets/filter/filter_sort.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/product_grid_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';
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
  List<String> items = [AppStrings.products, AppStrings.brands];
  String selectedItem = AppStrings.products;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController minimumController = TextEditingController();
  final TextEditingController maximumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final TextEditingController searchController = TextEditingController();
        final productCubit = ProductCubit.get(context);
        final brands = BrandsCubit.get(context).brands;
        List productDetails = productCubit.searchProducts;
        final searchList = productDetails
            .where((e) => searchValue.isNotEmpty
                ? (e.name?.toLowerCase().contains(searchValue.toLowerCase()) ??
                    false)
                : false)
            .toList();
        return Scaffold(
            endDrawer: FilterDrawer(
              minimumController: minimumController,
              maximumController: maximumController,
            ),
            key: _scaffoldKey,
            appBar: DefaultAppBar(
              isSearch: true,
              searchController: searchController,
              onChanged: (v) {
                setState(() {
                  searchValue = v;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.grey, width: 1.w)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: true,
                            value: selectedItem,
                            items: items
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Center(
                                        child: Text(
                                          item,
                                          style:
                                              AppTextStyle.cairoMedium14Black,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                                print(selectedItem.toString());
                              });
                            }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectedItem == AppStrings.brands
                            ? Toasters.show("You Cant Use Filter For Brands")
                            : _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.grey, width: 1.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.filter_alt_outlined,
                              color: AppColors.black,
                            ),
                            Text(
                              AppStrings.filter,
                              style: AppTextStyle.cairoMedium14Black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: FilterSort(
                    selectedItem: selectedItem,
                  )),
                ],
              ),
            ),
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
              child: isLoading ||
                      state is GetBrandsLoadingState ||
                      state is GetSearchProductLoadingState
                  ? const ProductGridShimmer()
                  : selectedItem == AppStrings.products
                      ? GridView.count(
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
                                          onTap: () {
                                            ProductCubit.get(context).quantity =
                                                1;
                                            productCubit
                                                .getRelatedProductsOfProduct(
                                                searchList[index].id);
                                            ProductCubit.get(context)
                                                .getDetailsOfProduct(
                                                    searchList[index].id);
                                            Navigator.pushNamed(context,
                                                RouteName.productScreen);
                                          },
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
                                            hasDiscount:
                                                searchList[index].hasDiscount ??
                                                    false,
                                            strokedPrice: searchList[index]
                                                    .strokedPrice ??
                                                '',
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
                                          onTap: () {
                                            ProductCubit.get(context).quantity =
                                                1;
                                            productCubit
                                                .getRelatedProductsOfProduct(
                                                productDetails[index].id);
                                            ProductCubit.get(context)
                                                .getDetailsOfProduct(
                                                    productDetails[index].id);
                                            Navigator.pushNamed(context,
                                                RouteName.productScreen);
                                          },
                                          child: ProductItem(
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
                                          ),
                                        ),
                                      )))
                      : GridView.count(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          mainAxisSpacing: 0.5.h,
                          crossAxisSpacing: 0.5.w,
                          childAspectRatio: 0.7,
                          children: searchList.isNotEmpty
                              ? List.generate(
                                  brands.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0.h, horizontal: 5.w),
                                        child: BrandsItem(
                                            logo: brands[index].logo ?? ''),
                                      ))
                              : List.generate(
                                  brands.length,
                                  (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0.h, horizontal: 5.w),
                                        child: InkWell(
                                            onTap: () {
                                              productCubit.getProductOfBrand(
                                                  id: brands[index].id,
                                                  page: 1);
                                              Navigator.pushNamed(
                                                  context,
                                                  RouteName
                                                      .productOfBrandScreen,
                                                  arguments: brands[index].id);
                                            },
                                            child: BrandsItem(
                                                logo:
                                                    brands[index].logo ?? '')),
                                      ))),
            ));
      },
    );
  }
}
