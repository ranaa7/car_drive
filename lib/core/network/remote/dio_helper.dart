
import 'package:dio/dio.dart';

import '../../app_constants/constants.dart';

class DioHelperr {
  static Dio dio = Dio();
  static const String baseURL = 'https://more2drive.com/api/v2/';
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 422) {
            // your http status code
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
    );
  }

  static Future<Response> postData({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    print('dio_helper postData');

    String authorization = 'Bearer ${token ?? ''}';

    String language = lang ;
    print('38');
    dio.options.headers = {
      'Authorization': authorization,
      'Accept-Language': language,
      'Content-Type': 'application/json',
    };



    Response response = await dio.post(endPoint, data: data ,  queryParameters: queryParameters,);
    return response;
  }




  //firebasenotification

  static Future<Response> postDatafirebase({
    required String endPoint,
    dynamic data,
  }) async {
    print('dio_helper postData');


    dio.options.headers = {
      'Authorization': 'key=AAAA_4aTvEI:APA91bFWkZfCuhH_m49J86Ec-XZMPgBGJlSWT6vM091j4vcHDWD-KZoBiVmrd-64jW6CTTTdTHaeDJD8I6wES5JSUdc7OcKIeBKn3OHv5E5SY0mF2CXvZARVOrzEAaUdaZysKhFLKksY',
      'Content-Type': 'application/json',
    };
    Response response = await dio.post(endPoint, data: data);
    return response;
  }

  static Future<Response> getData({
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${'token'}',
      'Accept-Language': lang,
      'Content-Type': 'application/json',
    };
    Response response = await dio.get(endPoint);
    return response;
  }

  static Future<Response> puttData(
      {required String endPoint,
      required Map<String, dynamic> data,
      // String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
      'Accept-Language': lang,
      'Content-Type': 'application/json',
    };
    Response response = await dio.put(endPoint, data: data);
    return response;
  }

  static Future<Response> deleteData(
      {required String endPoint, String? token}) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
      'Content-Type': 'application/json',
    };
    Response response = await dio.delete(endPoint);
    return response;
  }
}
