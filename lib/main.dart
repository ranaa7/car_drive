import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/blocobserve.dart';
import 'package:more_2_drive/config/router/router.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/themes.dart';
import 'package:more_2_drive/data/localization/localization_helper.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/locator.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/screens/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/screens/main_screen.dart';
import 'package:more_2_drive/presentation/screens/onboarding/view/onboarding_screen.dart';
import 'package:more_2_drive/presentation/screens/order_details/view/order_details_cubit.dart';
import 'package:more_2_drive/presentation/screens/order_item/view/order_item_cubit.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/update_profile/update_profile_cubit.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/view_models/counter/counter_cubit.dart';
import 'package:more_2_drive/presentation/screens/signup/view_models/signup_cubit.dart';
import 'package:more_2_drive/presentation/screens/splash_screen/splash_screen.dart';
import 'package:oktoast/oktoast.dart';

import 'presentation/cubits/app_cubit/app_cubit.dart';
import 'package:more_2_drive/presentation/register/view_models/phone_register_cubit.dart';
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
  print(splash);
  String? token = CacheHelper.getData(key: 'access_token');
  print(token);
  if (splash != null) {
    if (token != null) {
      print('Going to homescreen');
      widget = MainScreen();
    } else {
      print('Going to LoginScreen');
      widget = SplashScreen();
    }
  } else {
    print('Going to OnBoardingScreen');
    widget = const OnBoardingScreen();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp( MyApp(startWidget: widget)));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key ,  this.startWidget});

  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(create: (_) => BannerCubit(sl<BannerRepo>())..getBanner()),
          BlocProvider(create: (_) => CategoriesCubit(sl<CategoriesRepo>())..getAllCategories()..getTopCategories()),
          BlocProvider(create: (_) => ProductCubit(sl<ProductRepo>())..getAllProduct()..getFeaturedProduct()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignupCubit()),
          BlocProvider(create: (context) => PhoneRegisterCubit()),
          BlocProvider(create: (context) => OtpCubit()),
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => OrdersCubit()),
          BlocProvider(create: (context) => OrderDetailsCubit()),
          BlocProvider(create: (context) => OrderItemCubit()),
          BlocProvider(create: (context) => UpdateProfileCubit()),
        ],
        child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) => OKToast(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Themes.defaultTheme,
                color: AppColors.white,
                title: 'Speech',
                home: startWidget,
                onGenerateRoute: RouterApp.generateRoute,
                builder: LocalizeAndTranslate.directionBuilder,
                navigatorKey: RouterKeys.mainNavigatorKey,
                localizationsDelegates: context.delegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
              ),
            )),
      ),
    );
  }
}
