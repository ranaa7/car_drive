import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/product_model/all_produts_model.dart';
import 'package:more_2_drive/domain/models/product_model/details_of_product_model.dart';
import 'package:more_2_drive/domain/models/product_model/featured_product_model.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(InitState());

  static ProductCubit get(context, {bool listen = false}) =>
      BlocProvider.of<ProductCubit>(context, listen: listen);
  List<AllProductModel> allProduct = [];
  List<AllProductModel> searchProducts = [];
  List<FeaturedProductModel> featuredProduct = [];
  List<DetailsOfProductModel> detailsOfProducts = [];
  List<AllProductModel> productOfCategory = [];
  List<AllProductModel> productOfOffers = [];
  List<AllProductModel> productOfOils = [];
  List<AllProductModel> productOfBatteries = [];
  List<AllProductModel> productOfBrand = [];
  List<AllProductModel> relatedProductsOfProduct = [];
  int quantity = 1;

  plusPressed(index) {
    if (quantity < detailsOfProducts[index].currentStock!) {
      quantity++;
      emit(GetProductSuccessState());
    } else {
      Toasters.show("Upper Limit reached");
    }
  }

  minusPressed(index) {
    if (quantity > 1) {
      quantity--;
      emit(GetProductSuccessState());
    } else {
      Toasters.show("Lower Limit reached");
    }
  }

  getAllProduct() async {
    emit(GetProductLoadingState());
    final result = await _productRepo.getAllProduct();
    result.fold((l) {
      final allProducts = l.data["data"];
      if (allProducts != null) {
        allProduct = allProducts
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductSuccessState());
    }, (r) => emit(GetProductErrorState()));
  }

  getFeaturedProduct() async {
    emit(GetFeaturedProductLoadingState());
    final result = await _productRepo.getFeaturedProduct();

    result.fold((l) {
      final featureProduct = l.data["data"];
      if (featureProduct != null) {
        featuredProduct = featureProduct
            .map<FeaturedProductModel>((e) => FeaturedProductModel.fromJson(e))
            .toList();
      }
      emit(GetFeaturedProductSuccessState());
    }, (r) => emit(GetFeaturedProductErrorState()));
  }

  getDetailsOfProduct(id) async {
    emit(GetProductDetailsLoadingState());
    final result = await _productRepo.getDetailsOfProduct(id);

    result.fold((l) {
      final detailsOfProduct = l.data["data"];
      if (detailsOfProduct != null) {
        detailsOfProducts = detailsOfProduct
            .map<DetailsOfProductModel>(
                (e) => DetailsOfProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductDetailsSuccessState());
    }, (r) => emit(GetProductDetailsErrorState()));
  }

  getRelatedProductsOfProduct(id) async {
    emit(GetProductDetailsLoadingState());
    final result = await _productRepo.getRelatedProductsOfProduct(id);

    result.fold((l) {
      final relatedProductsOfProducts = l.data["data"];
      if (relatedProductsOfProducts != null) {
        relatedProductsOfProduct = relatedProductsOfProducts
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductDetailsSuccessState());
    }, (r) => emit(GetProductDetailsErrorState()));
  }
  String? sortKey;
      int? categories;
  String? minimum;
      String? maximum;
  getSearchProduct({
    int? page,
  }) async {
    if (page==1) {
      emit(GetSearchProductLoadingState());
    }
    final result = await _productRepo.getSearchProduct(
      page,
      sortKey,
      categories,
      minimum,
      maximum,
    );
    if (page == 1) {
      searchProducts.clear();
    }
    result.fold((l) {
      final searchProduct = l.data["data"];
      if (searchProduct != null) {
        searchProducts.addAll(searchProduct
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList());
      }
      print(page.toString());
      emit(GetSearchProductSuccessState());
    }, (r) => emit(GetSearchProductErrorState()));
  }

  getProductOfCategory({int? id, int? page}) async {
    emit(GetProductOfCategoryLoadingState());
    final result = await _productRepo.getProductOfCategories(id, page);
    if (page == 1) {
      productOfCategory.clear();
    }
    result.fold((l) {
      final productOfCategories = l.data["data"];
      if (productOfCategories != null) {
        productOfCategory.addAll(productOfCategories
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList());
      }
      print(page.toString());
      emit(GetProductOfCategorySuccessState());
    }, (r) => emit(GetProductOfCategoryErrorState()));
  }

  getProductsOfOfferCategory() async {
    emit(GetProductOfOfferLoadingState());
    final result = await _productRepo.getProductOfCategories(9, 1);

    result.fold((l) {
      final productOfCategories = l.data["data"];
      if (productOfCategories != null) {
        productOfOffers = productOfCategories
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductOfOfferSuccessState());
    }, (r) => emit(GetProductOfOfferErrorState()));
  }

  getProductsOfOilCategory() async {
    emit(GetProductOfOilLoadingState());
    final result = await _productRepo.getProductOfCategories(4, 1);

    result.fold((l) {
      final productOfCategories = l.data["data"];
      if (productOfCategories != null) {
        productOfOils = productOfCategories
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductOfOilSuccessState());
    }, (r) => emit(GetProductOfOilErrorState()));
  }

  getProductsOfBatteryCategory() async {
    emit(GetProductOfBatteryLoadingState());
    final result = await _productRepo.getProductOfCategories(7, 1);

    result.fold((l) {
      final productOfCategories = l.data["data"];
      if (productOfCategories != null) {
        productOfBatteries = productOfCategories
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList();
      }
      emit(GetProductOfBatterySuccessState());
    }, (r) => emit(GetProductOfBatteryErrorState()));
  }

  getProductOfBrand({int? id, int? page}) async {
    emit(GetProductOfBrandLoadingState());
    final result = await _productRepo.getProductOfBrands(id, page);
    if (page == 1) {
      productOfBrand.clear();
    }
    result.fold((l) {
      final productOfBrands = l.data["data"];
      if (productOfBrands != null) {
        productOfBrand.addAll(productOfBrands
            .map<AllProductModel>((e) => AllProductModel.fromJson(e))
            .toList());
      }
      emit(GetProductOfBrandSuccessState());
    }, (r) => emit(GetProductOfBrandErrorState()));
  }
}
