
import 'package:dio/dio.dart';

import '../../app_constants/constants.dart';

class DioHelper {
  static Dio dio = Dio();
  static const String baseURL = 'https://dev.more2drive.com/';
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

    String Authorization = 'Bearer ${token ?? ''}';
    print('36');
    String Langauge = lang ;
    print('38');
    dio.options.headers = {
      'Authorization': Authorization,
      'Accept-Language': Langauge,
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
      'Authorization': 'key=AAAA9mkG7zU:APA91bHwXplsYal17wbXUwpIqsh3lcKN4FgKw8iuU8RKpr1E9sahYPzx_mJqaJxgw6GvGD2n-RmUA6Wz3xiTXCd_drtoOVPDAojZulDizhv_xZQ2sMsR1fubotdve7L8sMWCuDP5AfKc',
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
      'Authorization': 'Bearer ${token ?? ''}',
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
