
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class CartRepo {
  final DioHelper _dio = DioHelper();
  Future<Either<ResponseModel, Failure>> addCart(
      {required int id,
      required String variant,
      required int userId,
      required int quantity}) async {
    try {
      Response response = await _dio.postRaw(
        token: Constants.token,
        endPoint: EndPoints.addCart,
        data: {
          "id": "$id",
          "variant": variant,
          "user_id": "$userId",
          "quantity": "$quantity",
          "cost_matrix": "ff09d187-d544-47a3-8e3a-0c1778f254b3",
        });

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      print(failure.message.toString());
      return Right(failure);

    }
  }
  Future<Either<ResponseModel, Failure>> updateCart(
      { String? cartId,
       String? quantity}) async {
    try {print({
      "cart_ids": cartId,
      "cart_quantities": quantity,
    });
      Response response = await _dio.postRaw(
        token: Constants.token,
        endPoint: EndPoints.updateCart,
        data: {
          "cart_ids": cartId,
          "cart_quantities": quantity,
        });

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      print(failure.message.toString());
      return Right(failure);

    }
  }
  Future<Either<dynamic, Failure>> getCartList() async {
    try {
      Response response = await _dio.post(
        token: Constants.token,
        endPoint: EndPoints.getCartList,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> getCartCount() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getCartCount,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> deleteProduct(cartId) async {
    try {
      Response response = await _dio.delete(
        token: Constants.token,
        endPoint: "${EndPoints.getCartList}/$cartId",
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

}
