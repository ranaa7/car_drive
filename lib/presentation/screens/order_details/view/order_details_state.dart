part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}
class OrderDetailsLoading extends OrderDetailsInitial {}
class OrderDetailsSuccess extends OrderDetailsInitial {
  final List<OrderDetails> orderDetail ;

  OrderDetailsSuccess(this.orderDetail);
}
class OrderDetailsFailure extends OrderDetailsInitial {
  final String errMessage;

  OrderDetailsFailure(this.errMessage);
}
