import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/constants.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class CarRepo{
  final DioHelper _dio = DioHelper();
  Future<Either<ResponseModel, Failure>> getCarBrands() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getCarBrands,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getCarBrandsModel(int carId) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getCarBrandsModel + carId.toString(),
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getUserCars() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getUserCars ,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> updateUserCar(int? carId) async {
    try {
      Response response = await _dio.post(
        data: {
          "car_id":"$carId"
        },
        token: Constants.token,
        endPoint: EndPoints.updateUserCar ,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> addCar(int carType,int carModel) async {
    try {
      Response response = await _dio.post(
        query: {
          'car_type':carType,
          'car_model':carModel
        },
        token: Constants.token,
        endPoint: EndPoints.addCar ,
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