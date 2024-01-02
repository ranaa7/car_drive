
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/cubits/app_cubit/app_cubit.dart';
import 'package:more_2_drive/presentation/cubits/app_cubit/app_state.dart';
import 'package:more_2_drive/presentation/screens/categories_screen/categories_screen.dart';
import 'package:more_2_drive/presentation/screens/home_screen/home_screen.dart';
import 'package:more_2_drive/presentation/screens/login_profile_screen/login_profile_screen.dart';
import 'package:more_2_drive/presentation/screens/notification_screen/notification_screen.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/profile_screen.dart';
import 'package:more_2_drive/presentation/screens/signup/views/signup_screen.dart';
import 'package:more_2_drive/presentation/widgets/custom_bottom_navigation/bottome_nav_bar.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../core/app_constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              ),
            ),
          ),
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: appCubit.currentIndex,
            onTap: appCubit.changeCurrentIndex,
          ),
        ));
  }
}
