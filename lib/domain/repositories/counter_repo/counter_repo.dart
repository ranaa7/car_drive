import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:more_2_drive/core/app_constants/constants.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';



import '../../../utils/strings/end_points.dart';
import '../../models/failure.dart';
import '../../models/response_model.dart';

class ProfileCounterRepo {

 final DioHelper _dio = DioHelper();
  Future<Either<dynamic, Failure>> getProfileCount() async {
    try {
      Response response = await _dio.get(
        token: token,
        endPoint: EndPoints.getProfileCounter,
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