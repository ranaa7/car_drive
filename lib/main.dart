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
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/domain/repositories/brands_repo/brands_repo.dart';
import 'package:more_2_drive/domain/repositories/car_repo/car_repo.dart';
import 'package:more_2_drive/domain/repositories/cart_repo/cart_repo.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/domain/repositories/order_repo/order_repo.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/domain/repositories/wishlist_repo/wishlist_repo.dart';
import 'package:more_2_drive/locator.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_cubit.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:more_2_drive/presentation/cubits/car_cubit/car_cubit.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:more_2_drive/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'package:oktoast/oktoast.dart';

import 'presentation/cubits/app_cubit/app_cubit.dart';
import 'presentation/screens/splash_screen/splash_screen.dart';
import 'utils/variables/routerkeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServiceLocator.init();
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit()),
          BlocProvider(
              create: (_) => BannerCubit(sl<BannerRepo>())..getBanner()),
          BlocProvider(
              create: (_) => CategoriesCubit(sl<CategoriesRepo>())
                ..getAllCategories()
                ..getTopCategories()),
          BlocProvider(
              create: (_) => ProductCubit(sl<ProductRepo>())
                ..getSearchProduct(
                  page: 1,
                )
                ..getProductsOfBatteryCategory()
                ..getProductsOfOfferCategory()
                ..getProductsOfOilCategory()
                ..getFeaturedProduct()),
          BlocProvider(
              create: (_) => BrandsCubit(sl<BrandsRepo>())..getBrands()),
          BlocProvider(
              create: (_) => CartCubit(sl<CartRepo>())..getCartCount()),
          BlocProvider(create: (_) => CarCubit(sl<CarRepo>())),
          BlocProvider(create: (_) => OrderCubit(sl<OrderRepo>())),
          BlocProvider(create: (_) => WishlistCubit(sl<WishlistRepo>())),
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
    );
  }
}
