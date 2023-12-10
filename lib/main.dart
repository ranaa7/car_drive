import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:get/get.dart';
import 'package:more_2_drive/blocobserve.dart';
import 'package:more_2_drive/config/router/router.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/themes.dart';
import 'package:more_2_drive/data/local/cache_helper.dart';
import 'package:more_2_drive/data/localization/localization_helper.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/presentation/home_screen.dart';
import 'package:more_2_drive/presentation/login/view/login_screen.dart';
import 'package:more_2_drive/presentation/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/onboarding/view/onboarding_screen.dart';
import 'package:more_2_drive/presentation/otp/view/otp_screen.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:more_2_drive/presentation/register/view/register_screen.dart';
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/locator.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:oktoast/oktoast.dart';

import 'presentation/cubits/app_cubit/app_cubit.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';
import 'package:more_2_drive/presentation/register/view_models/phone_register_cubit.dart';
import 'package:oktoast/oktoast.dart';
import 'core/network/remote/dio_helper.dart';
import 'utils/variables/routerkeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServiceLocator.init();
  await AppLocalization.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget;

  bool? splash = CacheHelper.getData(key: 'onboarding');
  String? token = CacheHelper.getData(key: 'access_token');
  if (splash != null) {
    if (token != null) {
      widget = HomeScreen();
    }
    else {
      widget = LoginScreen();
    }
  } else {
    widget = OnboardingScreen();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp( MyApp(startwidget: widget)));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  const MyApp({super.key , required this.startwidget});

  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(create: (_) => BannerCubit(sl<BannerRepo>())..getBanner()),
          BlocProvider(create: (_) => CategoriesCubit(sl<CategoriesRepo>())..getAllCategories()..getTopCategories()),
          BlocProvider(create: (_) => ProductCubit(sl<ProductRepo>())..getAllProduct()..getFeaturedProduct()),
        ],
        child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) => OKToast(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Themes.defaultTheme,
                color: AppColors.white,
                title: 'Speech',
                home: const SplashScreen(),
                onGenerateRoute: RouterApp.generateRoute,
                builder: LocalizeAndTranslate.directionBuilder,
                navigatorKey: RouterKeys.mainNavigatorKey,
                localizationsDelegates: context.delegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              ),
            )),
      ),
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return OKToast(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.defaultTheme,
            color: AppColors.white,
            title: 'Speech',
            home: LoginScreen(),
            onGenerateRoute: RouterApp.generateRoute,
            navigatorKey: RouterKeys.mainNavigatorKey,
            localizationsDelegates: const [
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => PhoneRegisterCubit()),
        BlocProvider(create: (context) => OtpCubit()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return OKToast(
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Themes.defaultTheme,
              color: AppColors.white,
              title: 'Speech',
              home: startwidget,
              onGenerateRoute: RouterApp.generateRoute,
              navigatorKey: RouterKeys.mainNavigatorKey,
              localizationsDelegates: const [

                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('ar', ''), Locale('en', '')],
              locale: const Locale('ar'),
            ),
          );
        },
      ),
    );
  }
}
