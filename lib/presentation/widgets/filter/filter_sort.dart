import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

import '../../components/toasters.dart';

class FilterSort extends StatefulWidget {
  final String selectedItem;
  const FilterSort({super.key, required this.selectedItem});

  @override
  State<FilterSort> createState() => _FilterSortState();
}

class _FilterSortState extends State<FilterSort> {
  String? selectedSort = "";
  final List selectedValue = [
    "",
    "price_high_to_low",
    "price_low_to_high",
    "new_arrival",
    "popularity",
    "top_rated",
  ];
  final List titles = [
    AppStrings.default1,
    AppStrings.highToLow,
    AppStrings.lowToHigh,
    AppStrings.newArrival,
    AppStrings.popularity,
    AppStrings.topRated,
  ];

  @override
  Widget build(BuildContext context) {
    final productCubit = ProductCubit.get(context);

    return InkWell(
      onTap: () {
        widget.selectedItem==AppStrings.brands?Toasters.show("You Cant Use Sort For Brands"):showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: SizedBox(
                    width: 100.w,
                    height: 310.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (context, index) => RadioListTile(
                              dense: true,
                              value: selectedValue[index],
                              groupValue: productCubit.sortKey,
                              activeColor: AppColors.grey,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                titles[index],
                                style: AppTextStyle.cairoMedium14Black,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  productCubit.sortKey = value;
                                });
                                productCubit.getSearchProduct(
                                    page: 1,);
                                Navigator.pop(context);
                              },
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: selectedValue.length),
                  ),
                ));
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: AppColors.grey,width: 1.w)),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center
          ,            children: [
            const Icon(Icons.sort,color: AppColors.black,),
            Text(
              AppStrings.sort,
              style: AppTextStyle.cairoMedium14Black,
            ),
          ],
        ),
      ),
    );
  }
}
