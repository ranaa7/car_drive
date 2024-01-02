import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesBanner extends StatelessWidget {
  final int index;

  const CategoriesBanner({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final CategoriesCubit topCategories = CategoriesCubit.get(context);

        final topCategory = topCategories.topCategory;
        return topCategory.isEmpty
            ? CustomImageView(
                height: 157.h,
                imagePath: Assets.imagesEmpty,
                fit: BoxFit.cover,
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CustomImageView(
                    height: 160.h,
                    width: 450.w,
                    url: topCategory[index].banner,
                    fit: BoxFit.fill,
                  ),
                ),
              );
      },
    );
  }
}
