import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/wishlist_model/wislist_add_response_model.dart';
import 'package:more_2_drive/domain/repositories/wishlist_repo/wishlist_repo.dart';
import 'package:more_2_drive/presentation/cubits/wishlist_cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _wishlistRepo;

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
  checkIfProductIsInWishlist(int? productId) async {
    emit(CheckIfProductInWishlistLoadingState());
    final result = await _wishlistRepo.checkIfProductIsInWishlist(productId);
    result.fold((l) {
      addResponseModel = WishlistAddResponseModel.fromJson(l);
      emit(CheckIfProductInWishlistSuccessState());
    }, (r) => emit(CheckIfProductInWishlistErrorState()));
  }
}
