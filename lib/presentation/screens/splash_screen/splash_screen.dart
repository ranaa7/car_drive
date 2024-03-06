import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:more_2_drive/generated/assets.dart';
import 'package:more_2_drive/presentation/components/custom_image_view.dart';
import 'package:more_2_drive/presentation/screens/login/view/login_screen.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../core/network/local/cache_helper.dart';
import '../main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _loading();
  }

  _loading() {
    Timer(const Duration(seconds: 3), () {

      bool? onboarding = CacheHelper.getData(key: 'onboarding');
      print(onboarding);
      String? token = CacheHelper.getData(key: 'access_token');
      print(token);
      if (onboarding != null) {
        if (token != null) {
          print('Going to homescreen');
       // const MainScreen();
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.mainScreen, (route) => false);
        }
        else {
          print('Going to LoginScreen');
         // LoginScreen();
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.onBoardingScreen, (route) => false);
        }
      } else {
        print('Going to OnBoardingScreen');
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.onBoardingScreen, (route) => false);
      }

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomImageView(
        imagePath: Assets.imagesSplash,
      ),
    );
  }
}
