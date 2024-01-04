import 'package:flutter/material.dart';

import 'package:more_2_drive/presentation/otp/view/otp_screen.dart';
import 'package:more_2_drive/presentation/register/view/register_screen.dart';
import 'package:more_2_drive/presentation/screens/brands_screen/product_of_brands_screen.dart';
import 'package:more_2_drive/presentation/screens/car_screen/add_or_edit_car_screen.dart';
import 'package:more_2_drive/presentation/screens/car_screen/select_car_screen.dart';
import 'package:more_2_drive/presentation/screens/cart_screen/cart_screen.dart';
import 'package:more_2_drive/presentation/screens/categories_screen/categories_screen.dart';
import 'package:more_2_drive/presentation/screens/categories_screen/product_of_category_screen.dart';
import 'package:more_2_drive/presentation/screens/home_screen/home_screen.dart';
import 'package:more_2_drive/presentation/screens/main_screen.dart';
import 'package:more_2_drive/presentation/screens/notification_screen/notification_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/views/order_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/add_or_edit_address_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/payment_method_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/pickup_address_screen.dart';
import 'package:more_2_drive/presentation/screens/order_screen/pickup_time_screen.dart';
import 'package:more_2_drive/presentation/screens/payment_screen/paymob_screen.dart';
import 'package:more_2_drive/presentation/screens/product_screen/product_screen.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/edit_profile_screen.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/profile_screen.dart';
import 'package:more_2_drive/presentation/screens/search_screen/search_screen.dart';
import 'package:more_2_drive/presentation/screens/signup/views/signup_screen.dart';
import 'package:more_2_drive/presentation/screens/splash_screen/splash_screen.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../presentation/screens/login/view/login_screen.dart';
import '../../presentation/screens/onboarding/view/onboarding_screen.dart';


class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
        case RouteName.splash:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        case RouteName.homeScreen:
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        case RouteName.profileScreen:
          return MaterialPageRoute(builder: (_) => const ProfileScreen());
        case RouteName.notificationScreen:
          return MaterialPageRoute(builder: (_) =>  const NotificationScreen());
        case RouteName.categoriesScreen:
          return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        case RouteName.cartScreen:
          return MaterialPageRoute(builder: (_) => const CartScreen());
        case RouteName.mainScreen:
          return MaterialPageRoute(builder: (_) => const MainScreen());
        case RouteName.productScreen:
          return MaterialPageRoute(builder: (_) => const ProductScreen());
        case RouteName.searchScreen:
          return MaterialPageRoute(builder: (_) => const SearchScreen());
        case RouteName.loginScreen:
          return MaterialPageRoute(builder: (_) =>  LoginScreen());
        case RouteName.registerScreen:
          return MaterialPageRoute(builder: (_) =>  RegisterScreen());
        case RouteName.otpScreen:
          return MaterialPageRoute(builder: (_) =>  OtpScreen());
        case RouteName.onBoardingScreen:
          return MaterialPageRoute(builder: (_) =>  const OnBoardingScreen());
        case RouteName.signupScreen:
          return MaterialPageRoute(builder: (_) =>  SignupScreen());
        case RouteName.orderScreen:
          return MaterialPageRoute(builder: (_) =>  OrderScreen());
        // case RouteName.orderDetailsScreen:
        //   return MaterialPageRoute(builder: (_) =>  OrderDetailsScreen(id: null,));
        case RouteName.editProfilescreen:
          return MaterialPageRoute(builder: (_) =>  EditProfileScreen());
        case RouteName.productOfCategoriesScreen:
          return MaterialPageRoute(builder: (_) =>  ProductOfCategoryScreen(  id: args as int,));
        case RouteName.productOfBrandScreen:
          return MaterialPageRoute(builder: (_) =>   ProductOfBrandScreen(id: args as int,));
        case RouteName.selectCarScreen:
          return MaterialPageRoute(builder: (_) => const SelectCarScreen());
        case RouteName.orderPickUpLocationScreen:
          return MaterialPageRoute(builder: (_) => const OrderPickUpLocationScreen());
        case RouteName.orderPickUpTimeScreen:
          return MaterialPageRoute(builder: (_) => const OrderPickUpTimeScreen());
        case RouteName.orderPaymentMethod:
          return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
        case RouteName.payMobScreen:
          return MaterialPageRoute(builder: (_) => const PayMobScreen());
        case RouteName.addOrEditCarScreen:
          return MaterialPageRoute(builder: (_) => const AddOrEditCarScreen());
        case RouteName.addOrEditAddressScreen:
          return MaterialPageRoute(builder: (_) => const AddOrEditAddressScreen());
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

  static navigateWithAnimate(context, Widget to,
          {double x = 1, double y = 0}) =>
      Navigator.push(context, _animateRouteBuilder(to, x: x, y: y));

  static _animateRouteBuilder(Widget to,
          {double x = 1, double y = 0, bool fullscreenDialog = false}) =>
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => to,
          opaque: false,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (context, animation, animationTime, child) {
            final tween = Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));
            final tween2 = Tween<double>(
              begin: 0,
              end: 1,
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation.drive(tween2),
                child: child,
              ),
            );
          });
}
