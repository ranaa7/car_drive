import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/presentation/screens/order_details/data/models/order_details_model.dart';


import '../../../../core/app_constants/constants.dart';
import '../../../../utils/strings/end_points.dart';


part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());
  static OrderDetailsCubit get(BuildContext context) => BlocProvider.of(context);

  List<orderDetails> orderdetails =[];
  getOrdersDetails(int? id) async {
    emit(OrderDetailsLoading());
    try {
      dynamic response = (
          await DioHelper().get(
              endPoint: EndPoints.getOrderDetails(id), token: token , ))
      ;


      // for (var i in response['data']) {
      //   myOrderList.add(PurchaseHistoryModel.fromJson(i));
      // }
      orderdetails = List<orderDetails>.from(response.data["data"].map((e)=>orderDetails.fromJson(e))).toList();
      emit(OrderDetailsSuccess(orderdetails));
    } catch (e) {
      emit(OrderDetailsFailure(e.toString()));
    }
  }
}
