import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

class CategoriesGridView extends StatelessWidget {
  final bool isLoading;

  const CategoriesGridView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
        final ProductCubit productCubit = ProductCubit.get(context);
        final categories = categoriesCubit.allCategory;
        return
          SizedBox(
            height: 320.h,
            child: categories.isEmpty || isLoading
                ? const CategoriesShimmer(isHome:true)
                : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 15.h),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () {
                        productCubit.getProductOfCategory(
                            id: categories[index].id, page: 1);
                        print(categories[index].id.toString());
                        Navigator.pushNamed(
                            context, RouteName.productOfCategoriesScreen,
                            arguments: categories[index].id);
                      },
                      child: ImageContainer(
                          networkImage: categories[index].banner ?? '',
                          height: 141,
                          width: 209),
                    )),
          );
        //   Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        //       child: Text(AppStrings.specialCategories,
        //         style: AppTextStyle.cairoSemiBold17Black,),
        //     ),
        //     SizedBox(height: 15.h,),
        //     isLoading?const CategoriesShimmer():SizedBox(
        //       height: 290.h,
        //       child: Row(
        //         children: [
        //           Column(
        //             children: [
        //               categories.isNotEmpty?ImageContainer(networkImage: categories[0].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
        //               SizedBox(height: 2.h,),
        //               categories.isNotEmpty?ImageContainer(networkImage: categories[1].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
        //             ],
        //           ),
        //           SizedBox(width: 2.w,),
        //           Column(
        //             children: [
        //               categories.isNotEmpty?ImageContainer(networkImage: categories[2].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
        //
        //               SizedBox(height: 2.h,),
        //               categories.isNotEmpty?ImageContainer(networkImage: categories[3].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
        //
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
