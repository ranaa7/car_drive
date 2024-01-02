part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}
class Ordersloadingstate extends OrdersInitial {}
class Orderssuccessstate extends OrdersInitial {
  final List<PurchaseHistoryModel> ordermodel;

  Orderssuccessstate(this.ordermodel);
}
class Ordersfailurestate extends OrdersInitial {
  final String errMessage;

  Ordersfailurestate(this.errMessage);
}

