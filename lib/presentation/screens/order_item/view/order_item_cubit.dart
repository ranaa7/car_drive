import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

import '../../../../core/app_constants/constants.dart';
import '../data/models/order_item_model.dart';

part 'order_item_state.dart';

class OrderItemCubit extends Cubit<OrderItemState> {
  OrderItemCubit() : super(OrderItemInitial());

  static OrderItemCubit get(BuildContext context) => BlocProvider.of(context);



  List<OrderDetailsItem> orderItems =[];

  getOrdersItems(int? id) async {
    emit(OrderItemLoading());
    try {
      dynamic response = (
          await DioHelper().get(
            endPoint: EndPoints.getOrderItem(id), token: token , ))
      ;


      // for (var i in response['data']) {
      //   myOrderList.add(PurchaseHistoryModel.fromJson(i));
      // }
      orderItems = List<OrderDetailsItem>.from(response.data["data"].map((e)=>OrderDetailsItem.fromJson(e))).toList();
      emit(OrderItemSuccess(orderItems));
    } catch (e) {
      emit(OrderItemFailure(e.toString()));
    }
  }
}
