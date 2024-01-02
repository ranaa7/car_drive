import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_reload_footer.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/presentation/widgets/special_product/product_item.dart';
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
  List<String> items = ["Product", "Brands"];
  String selectedItem = "Product";
  String? selectedSort = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final TextEditingController searchController = TextEditingController();
        final productCubit = ProductCubit.get(context);
        List productDetails = productCubit.searchProducts;
        final searchList = productDetails
            .where((e) => searchValue.isNotEmpty
                ? (e.name?.toLowerCase().contains(searchValue.toLowerCase()) ??
                    false)
                : false)
            .toList();
        return Scaffold(

          drawer:  Drawer(),
          key: _scaffoldKey,
            appBar: DefaultAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                      value: selectedItem,
                      items: items
                          .map((item) =>
                          DropdownMenuItem(
                            child: Text(
                              item,
                              style: AppTextStyle.cairoMedium14Black,
                            ),
                            value: item,
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value!;
                          if (selectedItem=="Brands") {
                            BrandsCubit.get(context).getBrands();
                            productDetails=BrandsCubit.get(context).brands;
                          }
                        });
                      }),
                  InkWell(
                    onTap:
                          () => _scaffoldKey.currentState?.openDrawer(),
                    child: Text(
                      "Filter",
                      style: AppTextStyle.cairoMedium14Black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        content:  Column(
                          children: [
                            RadioListTile(
                              dense: true,
                              value: "",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("Default"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              value: "price_high_to_low",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("High"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              value: "price_low_to_high",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("Low"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              value: "new_arrival",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("new"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              value: "popularity",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("Pop"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              value: "top_rated",
                              groupValue: selectedSort,
                              activeColor: AppColors.grey,
                              controlAffinity:
                              ListTileControlAffinity.leading,
                              title: Text("top"),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ));
                    },
                    child: Text(
                      "Sort",
                      style: AppTextStyle.cairoMedium14Black,
                    ),
                  ),
                ],
              ),
              isSearch: true,
              searchController: searchController,
              onChanged: (v) {
                setState(() {
                  searchValue = v;
                });
              },
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
              child: isLoading
                  ? const CategoriesShimmer()
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
                                  ))
                          : List.generate(
                              productDetails.length,
                              (index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0.h, horizontal: 5.w),
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
                                  ))),
            ));
      },
    );
  }
}
