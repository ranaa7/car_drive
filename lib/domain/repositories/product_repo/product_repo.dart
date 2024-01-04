// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

class ProductRepo {
  final DioHelper _dio = DioHelper();

  Future<Either<ResponseModel, Failure>> getAllProduct() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getAllProducts,
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getFeaturedProduct() async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getFeaturedProducts,
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getDetailsOfProduct(int? id) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getAllProducts + id.toString(),
        query: {'id': id},
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getRelatedProductsOfProduct(
      int? id) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getRelatedProducts + id.toString(),
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getProductOfCategories(
      int? id, int? page) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getProductOfCategories + id.toString(),
        query: {'page': page},
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getProductOfBrands(
      int? id, int? page) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getProductOfBrands + id.toString(),
        query: {'page': page},
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getSearchProduct(
    int? page,
    String? sortKey,
    int? categories,
    String? minimum,
    String? maximum,
  ) async {
    try {
      Response response = await _dio.get(
        endPoint: EndPoints.getSearchProducts,
        query: {
          'page': page,
          'sort_key': sortKey,
          'categories': "$categories",
          'min': minimum,
          'max': maximum
        },
      );

      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
