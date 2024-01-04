


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/brands_model/all_brands_model.dart';
import 'package:more_2_drive/domain/repositories/brands_repo/brands_repo.dart';
import 'package:more_2_drive/presentation/cubits/brands_cubit/brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandsRepo _brandsRepo;

  BrandsCubit(this._brandsRepo) : super(InitState());

  static BrandsCubit get(context, {bool listen = false}) =>
      BlocProvider.of<BrandsCubit>(context, listen: listen);
  List<AllBrandsModel> brands = [];

   getBrands(
      ) async {
     emit(GetBrandsLoadingState());
    final result = await _brandsRepo.getBrands();
    result.fold((l) {
        final allBrands = l.data["data"];
        if(allBrands != null){
          brands = allBrands.map<AllBrandsModel>((e)=>AllBrandsModel.fromJson(e)).toList();
        }
        emit(GetBrandsSuccessState());
    }, (r) => emit(GetBrandsErrorState()));
  }

}
