import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:more_2_drive/domain/models/failure.dart';
import 'package:more_2_drive/domain/models/response_model.dart';

class DioHelper {
  static const String kBaseUrl =
      "https://dev.more2drive.com";

  final Dio _dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
    receiveDataWhenStatusError: true,
  ));

  /// get
  Future get(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic> data = const {},
      String? token,
      ProgressCallback? onReceiveProgress}) async {
    try {
      _dio.options.headers = {'Authorization': "Bearer $token"};
      return await _dio.get(endPoint,
          data: FormData.fromMap(data),
          queryParameters: query,
          onReceiveProgress: onReceiveProgress);
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  /// post
  Future post(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token"
      };
      return await _dio.post(
        endPoint,
        data: FormData.fromMap(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          if (kDebugMode) {
            print(error.response!.data);
          }
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  /// put
  Future putData(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      return await _dio.put(
        endPoint,
        data: FormData.fromMap(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  /// delete
  Future delete({
    required String endPoint,
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      return await _dio.delete(endPoint,
          data: FormData.fromMap(data), queryParameters: query);
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }
}
