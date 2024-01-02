part of 'order_item_cubit.dart';

@immutable
abstract class OrderItemState {}

class OrderItemInitial extends OrderItemState {}
class OrderItemLoading extends OrderItemInitial {}
class OrderItemSuccess extends OrderItemInitial {
 List<OrderDetailsItem> orderItems =[];

  OrderItemSuccess(this.orderItems);
}
class OrderItemFailure extends OrderItemInitial {
  final String errMessage;

  OrderItemFailure(this.errMessage);
}
