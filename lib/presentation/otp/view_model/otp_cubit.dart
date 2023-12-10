import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:more_2_drive/presentation/otp/data/models/otp_model.dart';

import '../../../core/network/end_point/endpoints.dart';
import '../../../core/network/remote/dio_helper.dart';
import '../data/models/resend/resend_model.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(BuildContext context) => BlocProvider.of(context);


  otpModel otpmodel = otpModel();
  ResendModel resendModel = ResendModel();

  Future<void> verifyOtp(
      {required String otp}) async {
    emit(OtpLoading());
    try {
      var response = await DioHelper.postData(
        endPoint:EndPoints.confirmOtp,
        queryParameters: {
          'otp': otp
        },
      );

      if (response.data != null) {
        otpmodel = otpModel.fromJson(response.data);


        emit(OtpSuccess(otpmodel));

      } else {
        emit(OtpFailure(errMessage: "Response data is null."));

      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      emit(OtpFailure(errMessage: e.toString()));
    }
  }


  Future<void> ResendOtp(
      {required int? id}) async {
    emit(ResendLoading());
    try {
      var response = await DioHelper.postData(
        endPoint:EndPoints.resendOtp,
        queryParameters: {
          'id': id
        },
      );

      if (response.data != null) {

        resendModel = ResendModel.fromJson(response.data);

        emit(ResendSuccess(resendModel));
      } else {
        emit(ResendFailure(errMessage: "Response data is null."));

      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      emit(ResendFailure(errMessage: e.toString()));
    }
  }
}
