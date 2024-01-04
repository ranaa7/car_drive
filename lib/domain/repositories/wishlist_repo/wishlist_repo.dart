import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class WishlistRepo{
  final DioHelper _dio = DioHelper();
  Future<Either<dynamic, Failure>> addProductToWishlist(int? productId) async {
    try {
      Response response = await _dio.get(
        query: {
          "product_id":productId
        },
        token: Constants.token,
        endPoint: EndPoints.addProductToWishlist,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> removeProductFromWishlist(int? productId) async {
    try {
      Response response = await _dio.get(
        query: {
          "product_id":productId
        },
        token: Constants.token,
        endPoint: EndPoints.removeProductFromWishlist,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<dynamic, Failure>> checkIfProductIsInWishlist(int? productId) async {
    try {
      Response response = await _dio.get(
        query: {
          "product_id":productId
        },
        token: Constants.token,
        endPoint: EndPoints.checkIfProductIsInWishlist,
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