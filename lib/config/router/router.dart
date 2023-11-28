import 'package:flutter/material.dart';
import 'package:more_2_drive/presentation/view/cart_screen/cart_screen.dart';
import 'package:more_2_drive/presentation/view/categories_screen/categories_screen.dart';
import 'package:more_2_drive/presentation/view/home_screen/home_screen.dart';
import 'package:more_2_drive/presentation/view/notification_screen/notification_screen.dart';
import 'package:more_2_drive/presentation/view/profile_screen/profile_screen.dart';
import 'package:more_2_drive/presentation/view/splash_screen/splash_screen.dart';
import 'package:more_2_drive/presentation/widgets/custom_bottom_navigation/nav_bar.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';


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
          return MaterialPageRoute(builder: (_) => const NotificationScreen());
        case RouteName.categoriesScreen:
          return MaterialPageRoute(builder: (_) => const CategoriesScreen());
        case RouteName.cartScreen:
          return MaterialPageRoute(builder: (_) => const CartScreen());
        case RouteName.navBar:
          return MaterialPageRoute(builder: (_) => const NavBar());
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
