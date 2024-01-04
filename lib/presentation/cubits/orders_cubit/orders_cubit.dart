import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/presentation/screens/order_screen/data/models/order_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_constants/constants.dart';

import '../../../utils/strings/end_points.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(BuildContext context) => BlocProvider.of(context);

  List<PurchaseHistoryModel> myOrderList = [];

  getOrders(int? page  , String paymentStatus , String deliveryStatus) async {
    emit(Ordersloadingstate());
    try {
      dynamic response = (
          await DioHelper().get(
              endPoint: EndPoints.getorders, token: token , query: {
            'page':page,
            'payment_status': paymentStatus,
            'delivery_status': deliveryStatus
          }))
      ;


      // for (var i in response['data']) {
      //   myOrderList.add(PurchaseHistoryModel.fromJson(i));
      // }
      myOrderList = List<PurchaseHistoryModel>.from(response.data["data"].map((e)=>PurchaseHistoryModel.fromJson(e))).toList();
      emit(Orderssuccessstate(myOrderList));
    } catch (e) {
      emit(Ordersfailurestate(e.toString()));
    }
  }


   getOrdersForPaymentandDelivery(int? page , String paymentStatus , String deliveryStatus) async {
    emit(Ordersloadingstate());
    try {
      dynamic response = (
          await DioHelper().get(
          endPoint: EndPoints.getorders, token: token , query: {
            'page':page,
            'payment_status': paymentStatus,
            'delivery_status': deliveryStatus
          }))
          ;

      myOrderList = List<PurchaseHistoryModel>.from(response.data["data"].map((e)=>PurchaseHistoryModel.fromJson(e))).toList();
      emit(Orderssuccessstate(myOrderList));
    } catch (e) {
      emit(Ordersfailurestate(e.toString()));
    }
  }


  // getBanner(
  //     ) async {
  //   emit(GetBannerLoadingState());
  //   final result = await _bannerRepo.getBanner();
  //   result.fold((l) {
  //     final allBanners = l.data["data"];
  //     if(allBanners != null){
  //       banners = allBanners.map<BannerModel>((e)=>BannerModel.fromJson(e)).toList();
  //     }
  //     emit(GetBannerSuccessState());
  //   }, (r) => emit(GetBannerErrorState()));
  // }

}
