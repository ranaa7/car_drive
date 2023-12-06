import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/image_container.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
          final allCategories = categoriesCubit.allCategory;
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.imagesBackground,),fit: BoxFit.cover)),
            child: Center(
              child:
                // ListView.separated(
                //   physics: BouncingScrollPhysics(),
                //     itemBuilder: (context,index)=>SizedBox(
                //   height: 290.h,
                //   width: double.infinity,
                //   child: Row(
                //     children: [
                //       Stack(
                //         alignment: Alignment.center,
                //         children: [
                //           ImageContainer(networkImage: allCategories[index].banner??"", height: 290, width: 420,),
                //           Positioned(
                //             left: 30.w,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text(
                //                   allCategories[index].name ?? "",
                //                   style: AppTextStyle.cairoBold16White,
                //                 ),
                //                 SizedBox(
                //                   height: 5.h,
                //                 ),
                //                 Container(
                //                   height: 20.h,
                //                   width: 50.w,
                //                   color: AppColors.red,
                //                   child: FittedBox(
                //                     child: Text(
                //                       AppStrings.shopNow,
                //                       style: AppTextStyle.cairoBold16White,
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ), separatorBuilder: (context,_)=>SizedBox(height: 10.h,), itemCount: 6
                // )

              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      childAspectRatio:1.8,
                      ),
                  itemBuilder: (context, index) {
                    final String categoryName = allCategories[index].name??"";
                    return SizedBox(
                      height: 141.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ImageContainer(networkImage: allCategories[index].banner??"", height: 141, width: 212),
                              Positioned(
                                left: 30.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      allCategories[index].name ?? "",
                                      style: AppTextStyle.cairoBold16White,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 50.w,
                                      color: AppColors.red,
                                      child: FittedBox(
                                        child: Text(
                                          AppStrings.shopNow,
                                          style: AppTextStyle.cairoBold16White,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }

              ),
            ),
          );
        },
      ),
    );
  }
}
