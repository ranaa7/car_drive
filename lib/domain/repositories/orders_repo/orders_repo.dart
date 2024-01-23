import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/core/app_constants/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

import '../../../data/remote/dio_helper.dart';
import '../../models/failure.dart';
import '../../models/response_model.dart';

class OrdersRepo{
  final DioHelper _dio = DioHelper();

  Future<Either<ResponseModel, Failure>> getOrders(int? page, String paymentStatus , String deliveryStatus) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getorders,
          query: {
            'page':page,
            'payment_status': paymentStatus,
            'delivery_status': deliveryStatus
          },
          token: token
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }



}