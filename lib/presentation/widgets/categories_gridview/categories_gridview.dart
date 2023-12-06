import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:more_2_drive/presentation/widgets/shimmer/categories_shimmer.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class CategoriesGridView extends StatelessWidget {
  final bool isLoading;

  const CategoriesGridView({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
        final  categories = categoriesCubit.allCategory;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Text(AppStrings.specialCategories,
                style: AppTextStyle.cairoSemiBold17Black,),
            ),
            SizedBox(height: 15.h,),
            isLoading?const CategoriesShimmer():SizedBox(
              height: 290.h,
              child: Row(
                children: [
                  Column(
                    children: [
                      categories.isNotEmpty?ImageContainer(networkImage: categories[0].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
                      SizedBox(height: 2.h,),
                      categories.isNotEmpty?ImageContainer(networkImage: categories[1].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),
                    ],
                  ),
                  SizedBox(width: 2.w,),
                  Column(
                    children: [
                      categories.isNotEmpty?ImageContainer(networkImage: categories[2].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),

                      SizedBox(height: 2.h,),
                      categories.isNotEmpty?ImageContainer(networkImage: categories[3].banner??"", height: 141, width: 209):const ImageContainer(image: Assets.imagesEmpty, height: 141, width: 209),

                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
