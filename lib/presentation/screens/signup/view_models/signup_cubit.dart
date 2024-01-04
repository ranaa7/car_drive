

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:more_2_drive/presentation/screens/signup/data/models/signup_model.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';

import '../../../../core/network/remote/dio_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());


  static SignupCubit get(BuildContext context) => BlocProvider.of(context);


  SignupModel signupModel = SignupModel();



  Future<void> Signup({required String fname , required String secname ,required String email,required String password ,required String phone}) async {
    emit(SignupLoadingState());

    try {
      var response = await DioHelper.postData(
        endPoint:EndPoints.register,
        queryParameters: {
          'name': fname,
          'secname': secname,
          'email': email,
          'password': password,
          'phone': phone,
          'register_by': 'email'
        },

      );

      if (response.data != null) {
        signupModel = SignupModel.fromJson(response.data);

        emit(SignupSuccessState(signupModel));
      } else {
        emit(SignupFailureState(errMessage: "Response data is null."));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(SignupFailureState(errMessage: e.toString()));
    }
  }
}
