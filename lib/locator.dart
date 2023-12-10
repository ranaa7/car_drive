
import 'package:get_it/get_it.dart';
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';


final sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton<BannerRepo>(() => BannerRepo());
    sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo());
    sl.registerLazySingleton<ProductRepo>(() => ProductRepo());
  }
}
