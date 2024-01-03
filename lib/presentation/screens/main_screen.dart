import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/text_styles.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/app_cubit/app_cubit.dart';
import 'package:more_2_drive/presentation/cubits/app_cubit/app_state.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:more_2_drive/presentation/screens/categories_screen/categories_screen.dart';
import 'package:more_2_drive/presentation/screens/home_screen/home_screen.dart';
import 'package:more_2_drive/presentation/screens/login_profile_screen/login_profile_screen.dart';
import 'package:more_2_drive/presentation/screens/notification_screen/notification_screen.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/profile_screen.dart';
import 'package:more_2_drive/presentation/widgets/custom_bottom_navigation/bottome_nav_bar.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../core/app_constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
        builder: (context, state) => Scaffold(
          extendBody: true,
          body: [
            const HomeScreen(),
            const CategoriesScreen(),
             NotificationScreen(),
          token != null? ProfileScreen() : LoginProfileScreen(),
          ][appCubit.currentIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: 70.h,
            width: 70.w,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () => Navigator.pushNamed(
                context,
                RouteName.cartScreen,
              ),
              child: CustomImageView(
                svgPath: Assets.svgShoppingCart,
                height: 33.h,
                width: 33.w,
                fit: BoxFit.contain,
                color: AppColors.white,
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        extendBody: true,
        body: [
          const HomeScreen(),
          const CategoriesScreen(),
          const NotificationScreen(),
          const ProfileScreen(),
        ][appCubit.currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: 70.h,
              width: 70.w,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  CartCubit.get(context).getCartList();
                  Navigator.pushNamed(
                    context,
                    RouteName.cartScreen,
                  );
                },
                child: CustomImageView(
                  imagePath: Assets.imagesCart,
                  height: 35.h,
                  width: 35.w,
                  fit: BoxFit.contain,
                  color: AppColors.white,
                ),
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final cartCount = CartCubit.get(context).cartCounts;
                return Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: FittedBox(
                      child: Text(
                    "$cartCount",
                    style: AppTextStyle.cairoBlack17Black,
                  )),
                );
              },
            )
          ],
        ),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: appCubit.currentIndex,
          onTap: appCubit.changeCurrentIndex,
        ),
      );
    });
  }
}
