import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:more_2_drive/blocobserve.dart';
import 'package:more_2_drive/config/router/router.dart';
import 'package:more_2_drive/config/style/app_colors.dart';
import 'package:more_2_drive/config/style/themes.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/presentation/home_screen.dart';
import 'package:more_2_drive/presentation/login/view/login_screen.dart';
import 'package:more_2_drive/presentation/login/view_models/login_cubit.dart';
import 'package:more_2_drive/presentation/onboarding/view/onboarding_screen.dart';
import 'package:more_2_drive/presentation/otp/view/otp_screen.dart';
import 'package:more_2_drive/presentation/otp/view_model/otp_cubit.dart';
import 'package:more_2_drive/presentation/register/view/register_screen.dart';
import 'package:more_2_drive/presentation/register/view_models/phone_register_cubit.dart';
import 'package:oktoast/oktoast.dart';
import 'core/network/remote/dio_helper.dart';
import 'utils/variables/routerkeys.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
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
