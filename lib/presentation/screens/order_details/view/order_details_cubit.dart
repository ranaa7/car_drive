import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:more_2_drive/core/network/remote/dio_helper.dart';
import 'package:more_2_drive/core/network/remote/firebase_api.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/presentation/screens/order_details/data/models/order_details_model.dart';
import 'package:more_2_drive/presentation/screens/order_details/view_models/order_details_screen.dart';



import '../../../../core/app_constants/constants.dart';
import '../../../../utils/strings/end_points.dart';


part 'order_details_state.dart';


class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(BuildContext context) => BlocProvider.of(context);

  List<OrderDetails> orderdetails =[];
  getOrdersDetails(int? id) async {
    emit(OrderDetailsLoading());
    try {
      dynamic response = (
          await DioHelper().get(
              endPoint: EndPoints.getOrderDetails(id), token: token , ))
      ;

      orderdetails = List<OrderDetails>.from(response.data["data"].map((e)=>OrderDetails.fromJson(e))).toList();
      emit(OrderDetailsSuccess(orderdetails));
    } catch (e) {
      emit(OrderDetailsFailure(e.toString()));
    }
  }



  Future<void> sendNotifications() async {
    // print(orderid);
    // print(fcmToken);
    await DioHelperr.postDatafirebase(
        endPoint: EndPoints.pushNotification, data: {'to': deviceToken,'notification': {
      'title' : "you have recieved message from More2drive",
      'body' : "your order ${orderid} status is completed",
      'sound' : "default"
    },"data": {
      "type": "order",
      "id": orderid,
      "click_action": "activity name"
    }
    });
}}
