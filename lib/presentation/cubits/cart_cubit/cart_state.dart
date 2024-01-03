abstract class CartState{}
class InitState extends CartState{}
class AddCarQuantityState extends CartState{}
class AddCartLoadingState extends CartState{}
class AddCartSuccessState extends CartState{}
class AddCartErrorState extends CartState{
  final String? message;

  AddCartErrorState({this.message});
}
class UpdateCartLoadingState extends CartState{}
class UpdateCartSuccessState extends CartState{}
class UpdateCartErrorState extends CartState{
  final String? message;

  UpdateCartErrorState({this.message});
}
class GetCartListLoadingState extends CartState{}
class GetCartListSuccessState extends CartState{}
class GetCartListErrorState extends CartState{
  final String? message;

  GetCartListErrorState({this.message});
}
class DeleteProductFromCartLoadingState extends CartState{}
class DeleteProductFromCartSuccessState extends CartState{}
class DeleteProductFromCartErrorState extends CartState{
  final String? message;

  DeleteProductFromCartErrorState({this.message});
}
class GetCartCountLoadingState extends CartState{}
class GetCartCountSuccessState extends CartState{}
class GetCartCountErrorState extends CartState{
  final String? message;

  GetCartCountErrorState({this.message});
}

