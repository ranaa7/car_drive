part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}
class OrderDetailsLoading extends OrderDetailsInitial {}
class OrderDetailsSuccess extends OrderDetailsInitial {
  List<orderDetails> orderdetails =[];

  OrderDetailsSuccess(this.orderdetails);
}
class OrderDetailsFailure extends OrderDetailsInitial {
  final String errMessage;

  OrderDetailsFailure(this.errMessage);
}
