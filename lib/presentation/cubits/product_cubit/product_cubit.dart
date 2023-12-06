

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/product_model/all_produts_model.dart';
import 'package:more_2_drive/domain/models/product_model/details_of_product_model.dart';
import 'package:more_2_drive/domain/models/product_model/featured_product_model.dart';
import 'package:more_2_drive/domain/repositories/product_repo/product_repo.dart';
import 'package:more_2_drive/presentation/cubits/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  ProductCubit(this._productRepo) : super(InitState());

  static ProductCubit get(context, {bool listen = false}) =>
      BlocProvider.of<ProductCubit>(context, listen: listen);
List<AllProductModel> allProduct=[];
List<FeaturedProductModel> featuredProduct=[];
List<DetailsOfProductModel> detailsOfProducts=[];
getAllProduct(
      ) async {
    final result = await _productRepo.getAllProduct();

    result.fold((l) {
      final allProducts = l.data["data"];
      if(allProducts != null){
        allProduct = allProducts.map<AllProductModel>((e)=>AllProductModel.fromJson(e)).toList();
      }
      emit(GetProductSuccessState());

    }, (r) => emit(GetProductErrorState()));
  }
  getFeaturedProduct(
      ) async {
    final result = await _productRepo.getFeaturedProduct();

    result.fold((l) {
      final featureProduct = l.data["data"];
      if(featureProduct != null){
        featuredProduct = featureProduct.map<FeaturedProductModel>((e)=>FeaturedProductModel.fromJson(e)).toList();
      }
      emit(GetProductSuccessState());

    }, (r) => emit(GetProductErrorState()));
  }
  getDetailsOfProduct(
      ) async {
    final result = await _productRepo.getDetailsOfProduct();

    result.fold((l) {
      final detailsOfProduct = l.data["data"];
      if(detailsOfProduct != null){
        detailsOfProducts = detailsOfProduct.map<DetailsOfProductModel>((e)=>DetailsOfProductModel.fromJson(e)).toList();
      }
      emit(GetProductSuccessState());

    }, (r) => emit(GetProductErrorState()));
  }

}
