import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_state.dart';
import 'package:more_2_drive/presentation/widgets/default_appbar/default_appbar.dart';
import 'package:more_2_drive/utils/strings/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List notification = [];
    return Scaffold(
      backgroundColor: AppColors.scaffoldGround,
      appBar: DefaultAppBar(
        title: AppStrings.notification,
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          return SizedBox(
            width: 500.w,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: WishlistCubit.get(context).wishlist.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  surfaceTintColor: Colors.transparent,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: () {},
                          icon: Icon(
                            Icons.favorite, color: AppColors.red2, size: 30,)),


                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [


                            Text(
                              WishlistCubit.get(context).wishlist[index].product?.name ??"",
                              style: AppTextStyle.cairoBoldgrey17,
                            ),
                            Text(
                              WishlistCubit.get(context).wishlist[index].product?.basePrice ??"",
                              style: AppTextStyle.cairoBoldred17,
                            ),

                          ],
                        ),
                      ),

                      Flexible(
                        child: Image.asset(
                          Assets.imagesProduct,
                          height: 130.h,
                          // color: AppColors.Scaffoldfground,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),

    );
  }
}
