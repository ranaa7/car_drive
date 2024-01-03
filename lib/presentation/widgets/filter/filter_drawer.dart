import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/app_textfield.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/widgets/buttons/button_1.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class FilterDrawer extends StatefulWidget {
  final TextEditingController minimumController ;
  final TextEditingController maximumController ;

  const FilterDrawer({super.key, required this.minimumController, required this.maximumController});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  bool? isSelected = false;
  final List selectedCategories = [];
  @override
  Widget build(BuildContext context) {
final    categories = CategoriesCubit.get(context).allCategory;

    return Drawer(
      width: 250.w,
      child: Container(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: [
            Container(
              height: 125.h,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.priceRange,
                    style: AppTextStyle.cairoMedium14Black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: AppTextFormField(
                          textInput: TextInputType.number,
                          hintText: AppStrings.minimum,
                          controller: widget.minimumController,
                        ),
                      ),
                      Text(" - ",style: AppTextStyle.cairoMedium14Black,),
                      SizedBox(
                        width: 100.w,
                        child: AppTextFormField(
                          textInput: TextInputType.number,
                          hintText: AppStrings.maximum,
                          controller: widget.maximumController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 450.h,
              child: ListView.separated(
                  itemBuilder: (context, index) => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                    title: Text(categories[index].name??'',style: AppTextStyle.cairoMedium14Black,),
                      value: ProductCubit.get(context).categories==categories[index].id,
                      onChanged: (value) {
                        if ( value!) {
                          setState(() {
                            selectedCategories.clear();
                            ProductCubit.get(context).categories=categories[index].id;
                            selectedCategories.add(categories[index].id);
                          });
                        } else {
                          setState(() {
                            ProductCubit.get(context).categories=null;
                            selectedCategories.remove(categories[index].id);
                          });
                        }
                      }),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 8),
            ),
            SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button1(
                      height: 50,
                      width: 100,
                      onPressed: () {
                        widget.maximumController.clear();
                        widget.minimumController.clear();
                        ProductCubit.get(context).getSearchProduct(page: 1);
                      },
                      text: AppStrings.clear,
                      color: AppColors.red),
                  Button1(
                      height: 50,
                      width: 100,
                      onPressed: () {
                        var min = widget.minimumController.text.toString();
                        var max = widget.maximumController.text.toString();
                        ProductCubit.get(context).minimum=min;
                        ProductCubit.get(context).maximum=max;
                        if (min != "" && max != ""&&selectedCategories.isNotEmpty) {
                          if (max.compareTo(min) < 0) {
                            Toasters.show(AppStrings.minMaxWarning);
                          }  else{
                            ProductCubit.get(context).categories= selectedCategories[0];

                            ProductCubit.get(context).getSearchProduct(page:1,);
                          }
                        }else if (selectedCategories.isNotEmpty) {
                          ProductCubit.get(context).categories= selectedCategories[0];
                          ProductCubit.get(context).getSearchProduct(page: 1,);
                        }else if (min != "" && max != "") {
                          ProductCubit.get(context).getSearchProduct(page: 1,);
                        }
                      },
                      text: AppStrings.apply,
                      color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
