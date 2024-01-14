
import 'package:get_it/get_it.dart';
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/domain/repositories/brands_repo/brands_repo.dart';
import 'package:more_2_drive/domain/repositories/car_repo/car_repo.dart';
import 'package:more_2_drive/domain/repositories/cart_repo/cart_repo.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/domain/repositories/clubpoints_repo/clubpoints_repo.dart';
import 'package:more_2_drive/domain/repositories/order_repo/order_repo.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/domain/repositories/wishlist_repo/wishlist_repo.dart';
import 'package:more_2_drive/presentation/cubits/wallet_cubit/wallet_cubit.dart';


final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<BannerRepo>(() => BannerRepo());
    sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo());
    sl.registerLazySingleton<ProductRepo>(() => ProductRepo());
    sl.registerLazySingleton<BrandsRepo>(() => BrandsRepo());
    sl.registerLazySingleton<CartRepo>(() => CartRepo());
    sl.registerLazySingleton<CarRepo>(() => CarRepo());
    sl.registerLazySingleton<OrderRepo>(() => OrderRepo());
    sl.registerLazySingleton<WishlistRepo>(() => WishlistRepo());
    sl.registerLazySingleton<WalletRepo>(() => WalletRepo());
  }
}
