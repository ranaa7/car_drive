import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/wishlist_model/wislist_add_response_model.dart';
import 'package:more_2_drive/domain/repositories/wishlist_repo/wishlist_repo.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_state.dart';

import '../../../domain/models/wishlist_model/wishlist_model.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _wishlistRepo;

  List<WishlistModel> wishlist =[];

  WishlistCubit(this._wishlistRepo) : super(InitState());

  static WishlistCubit get(context, {bool listen = false}) =>
      BlocProvider.of<WishlistCubit>(context, listen: listen);
  WishlistAddResponseModel? addResponseModel;

  addProductToWishlist(int productId) async {
    emit(AddProductToWishlistLoadingState());
    final result = await _wishlistRepo.addProductToWishlist(productId);
    result.fold((l) {
      addResponseModel?.isInWishlist=true;
      emit(AddProductToWishlistSuccessState());
    }, (r) => emit(AddProductToWishlistErrorState()));
  }



  getWishlists() async {
    emit(GetWishlistLoadingState());
    final result = await _wishlistRepo.getWishlists();
    result.fold((l) {
      final allWishlists = l.data["data"];
      if (allWishlists != null) {
        wishlist = allWishlists
            .map<WishlistModel>((e) => WishlistModel.fromJson(e))
            .toList();
      }
      print(wishlist.toString());
      emit(GetWishlistSuccessState());
    }, (r) => emit(GetWishlistErrorState()));
  }
  removeProductFromWishlist(int productId) async {
    emit(RemoveWishlistLoadingState());
    final result = await _wishlistRepo.removeProductFromWishlist(productId);
    result.fold((l) {
      addResponseModel?.isInWishlist=false;
      emit(RemoveWishlistSuccessState());
    }, (r) => emit(RemoveWishlistErrorState()));
  }
  checkIfProductIsInWishlist(int? productId) async {
    emit(CheckIfProductInWishlistLoadingState());
    final result = await _wishlistRepo.checkIfProductIsInWishlist(productId);
    result.fold((l) {
      addResponseModel = WishlistAddResponseModel.fromJson(l);
      emit(CheckIfProductInWishlistSuccessState());
    }, (r) => emit(CheckIfProductInWishlistErrorState()));
  }
}
