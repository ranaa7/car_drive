import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/core/app_constants/constants.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class WalletRepo{
  final DioHelper _dio = DioHelper();

  Future<Either<dynamic, Failure>> getClubpoints(int? page) async {
    try {
      Response response = await _dio.get(
        token: token,
        endPoint: EndPoints.getClubpoints, query: {
      'page':page,

      }
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }


  Future<Either<dynamic, Failure>> addClubpointsToWallet(int? productId) async {
    try {
      Response response = await _dio.get(
        query: {
          "id":productId
        },
        token:token,
        endPoint: EndPoints.convertIntoWallet,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }


  Future<Either<dynamic, Failure>> getWalletBalance() async {
    try {
      Response response = await _dio.get(
        token: token,
        endPoint: EndPoints.walletBalance,
      );
      print(response.data.toString());
      return Left(response.data);
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }


  Future<Either<dynamic, Failure>> getWalletHistory(int? page) async {
    try {
      Response response = await _dio.get(
          token: token,
          endPoint: EndPoints.walletHistory, query: {
        'page':page,

      }
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