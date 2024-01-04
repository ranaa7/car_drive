


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/banner_model/banner_model.dart';
import 'package:more_2_drive/domain/repositories/banner_repo/banner_repo.dart';
import 'package:more_2_drive/presentation/cubits/banner_cubit/banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerRepo _bannerRepo;

  BannerCubit(this._bannerRepo) : super(InitState());

  static BannerCubit get(context, {bool listen = false}) =>
      BlocProvider.of<BannerCubit>(context, listen: listen);
  List<BannerModel> banners = [];

   getBanner(
      ) async {
     emit(GetBannerLoadingState());
    final result = await _bannerRepo.getBanner();
    result.fold((l) {
        final allBanners = l.data["data"];
        if(allBanners != null){
          banners = allBanners.map<BannerModel>((e)=>BannerModel.fromJson(e)).toList();
        }
        emit(GetBannerSuccessState());
    }, (r) => emit(GetBannerErrorState()));
  }

}
