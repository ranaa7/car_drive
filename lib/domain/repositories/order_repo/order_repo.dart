import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class OrderRepo{
  final DioHelper _dio = DioHelper();
  Future<Either<ResponseModel, Failure>> getPickupPoints() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getPickupPoint,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<dynamic, Failure>> getPaymentTypes() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getPaymentTypes,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> getCartSummary() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getCartSummary,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> applyCoupon(String couponCode) async {
    try {
      Response response = await _dio.post(
        query: {
          "coupon_code":couponCode
        },
        token: Constants.token,
        endPoint: EndPoints.applyCoupon,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> removeCoupon() async {
    try {
      Response response = await _dio.post(
        token: Constants.token,
        endPoint: EndPoints.removeCoupon,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> updateShippingTypeInCart(int? shippingId,String? shippingType) async {
    try {
      Response response = await _dio.postRaw(
        data: {
          "shipping_id": shippingId,
          "shipping_type":"${shippingType}"
        },
        token: Constants.token,
        endPoint: EndPoints.updateShippingTypeInCart,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> updatePickupDateInCart(DateTime date) async {
    try {
      Response response = await _dio.postRaw(
        data: {
          "date": date.toIso8601String(),
        },
        token: Constants.token,
        endPoint: EndPoints.updatePickupDateInCart,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getUserAddress() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getUserAddress,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getStateByCountry() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getStateByCountry,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getCityByState(int? stateId) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getCityByState + stateId.toString(),
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> createUserAddress(
    int userId,String address,int countryId, int stateId,int cityId,String? postalCode,String? phone) async {
    try {
      Response response = await _dio.post(
        token: Constants.token,
        data: {
          "user_id":userId,
          "address":address,
          "country_id":countryId,
          "state_id":stateId,
          "city_id":cityId,
          "postal_code":postalCode,
          "phone":phone,
        },
        endPoint: EndPoints.createUserAddress,
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