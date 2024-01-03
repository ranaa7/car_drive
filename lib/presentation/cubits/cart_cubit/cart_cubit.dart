import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/domain/models/cart_model/cart_list_model.dart';
import 'package:more_2_drive/domain/repositories/cart_repo/cart_repo.dart';
import 'package:more_2_drive/presentation/components/toasters.dart';
import 'package:more_2_drive/presentation/cubits/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(InitState());

  static CartCubit get(context, {bool listen = false}) =>
      BlocProvider.of<CartCubit>(context, listen: listen);
  List<GetCartListModel> cartList = [];
  int cartCounts = 0;

  plusPressed(index) {
   if (cartList[index].quantity<=cartList[index].upperLimit) {
     cartList[index].quantity++;
     emit(AddCarQuantityState());
   }else{
     Toasters.show("Upper Limit reached");
   }
  }

  minusPressed(index) {
    if (cartList[index].quantity > cartList[index].lowerLimit) {
      cartList[index].quantity--;
      emit(AddCarQuantityState());
    }else{
      Toasters.show("Lower Limit reached");

    }

  }

  addCart(int productId, int productQuantity) async {
    emit(AddCartLoadingState());
    final result = await _cartRepo.addCart(
      id: productId,
      userId: 493,
      variant: '',
      quantity: productQuantity,
    );
    result.fold((l) async {
      await getCartList();
      await getCartCount();
      emit(AddCartSuccessState());

    }, (r) => emit(AddCartErrorState()));
    print(result.toString());
  }

  updateCart() async {
    emit(UpdateCartLoadingState());

    final result = await _cartRepo.updateCart(
      cartId: cartList.map((e) => (e.id.toString()) + ("")).toList().toString().replaceAll("[", "").replaceAll("]", ""),
      quantity: cartList.map((e) => (e.quantity.toString()) + ("")).toList().toString().replaceAll("[", "").replaceAll("]", ""),
    );
    result.fold((l) async {
      emit(UpdateCartSuccessState());
    }, (r) => emit(AddCartErrorState()));
    print(result.toString());
  }

  getCartList() async {
    emit(GetCartListLoadingState());
    final result = await _cartRepo.getCartList();
    result.fold((l) {
      cartList = [];
      if (l.isNotEmpty) {
        final getCartList = l[0]["cart_items"];
        if (getCartList != null) {
          cartList = getCartList
              .map<GetCartListModel>((e) => GetCartListModel.fromJson(e))
              .toList();
        }
      }
      emit(GetCartListSuccessState());
      getCartCount();
    }, (r) => emit(GetCartListErrorState()));
  }

  deleteProduct(cartId) async {
    emit(DeleteProductFromCartLoadingState());
    final result = await _cartRepo.deleteProduct(cartId);
    result.fold((l) async{
      await getCartList();
      await getCartCount();
      emit(DeleteProductFromCartSuccessState());
    }, (r) => emit(DeleteProductFromCartErrorState()));
  }

  getCartCount() async {
    emit(GetCartCountLoadingState());
    final result = await _cartRepo.getCartCount();
    result.fold((l) {
      print(l['count']);
      if (l['count'] != 0) {
        cartCounts = l['count'];
      }if (l['count'] == 0) {
        cartCounts = 0;
      }
      emit(GetCartCountSuccessState());
    }, (r) => emit(GetCartCountErrorState()));
  }
}
