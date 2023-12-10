

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/categories_model/category_model.dart';
import 'package:more_2_drive/domain/models/categories_model/top_categories_model.dart';
import 'package:more_2_drive/domain/repositories/categories_repo/categories_repo.dart';
import 'package:more_2_drive/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo _categoriesRepo;

  CategoriesCubit(this._categoriesRepo) : super(InitState());

  static CategoriesCubit get(context, {bool listen = false}) =>
      BlocProvider.of<CategoriesCubit>(context, listen: listen);
List<CategoryModel> allCategory=[];
List<TopCategoriesModel> topCategory=[];
   getAllCategories(
      ) async {
    final result = await _categoriesRepo.getAllCategories();

    result.fold((l) {
      final allCategories = l.data["data"];
      if(allCategories != null){
        allCategory = allCategories.map<CategoryModel>((e)=>CategoryModel.fromJson(e)).toList();
      }
      emit(GetAllCategoriesSuccessState());

    }, (r) => emit(GetAllCategoriesErrorState()));
  }
  getTopCategories(
      ) async {
    final result = await _categoriesRepo.getTopCategories();

    result.fold((l) {
      final topCategories = l.data["data"];
      if(topCategories != null){
        topCategory = topCategories.map<TopCategoriesModel>((e)=>TopCategoriesModel.fromJson(e)).toList();
      }
      emit(GetTopCategoriesSuccessState());

    }, (r) => emit(GetTopCategoriesErrorState()));
  }

}
