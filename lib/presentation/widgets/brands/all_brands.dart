import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/app_shadows.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_state.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        final BrandsCubit brandsCubit = BrandsCubit.get(context);
        final allBrands = brandsCubit.brands;
        final ProductCubit productCubit = ProductCubit.get(context);
        return Container(
          decoration: const BoxDecoration(boxShadow: AppShadows.shadow3),
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                child: Text(
                  AppStrings.brands,
                  style: AppTextStyle.cairoSemiBold17Black,
                ),
              ),
              SizedBox(height:5.h),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      productCubit.getProductOfBrand(id: allBrands[index].id,page: 1);
                      Navigator.pushNamed(context, RouteName.productOfBrandScreen,arguments:allBrands[index].id );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.white),
                      child: FittedBox(
                          child: CustomImageView(
                        url: allBrands[index].logo ?? "",
                        height: 90.h,
                        width: 90.h,
                      )),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 20.w,
                  ),
                  itemCount: allBrands.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
