import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:more_2_drive/blocobserve.dart';
import 'package:more_2_drive/config/router/router.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/themes.dart';
import 'package:more_2_drive/data/local/cache_helper.dart';
import 'package:more_2_drive/data/localization/localization_helper.dart';
import 'package:more_2_drive/presentation/login/view/login_screen.dart';
import 'package:more_2_drive/presentation/onboarding/view/onboarding_screen.dart';
import 'package:more_2_drive/presentation/register/view/register_screen.dart';
import 'package:oktoast/oktoast.dart';

import 'presentation/cubits/app_cubit/app_cubit.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';
import 'utils/variables/routerkeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await AppLocalization.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) => MultiBlocProvider(
            providers: [BlocProvider(create: (_) => AppCubit())],
            child: OKToast(
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

              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ar', ''), Locale('en', '')],
            locale: const Locale('ar'),
          ),
        );
      },
    );
  }
}
