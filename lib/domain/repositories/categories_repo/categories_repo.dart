import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class CategoriesRepo{
  final DioHelper _dio = DioHelper();
  Future<Either<ResponseModel, Failure>> getTopCategories() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getTopCategories,
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
  Future<Either<ResponseModel, Failure>> getAllCategories() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getAllCategories,
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }


}