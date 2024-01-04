import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';


import '../../../../../core/app_constants/constants.dart';

import '../data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();

 userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    print("23");

    try {
      var response = await DioHelper().post(
        endPoint:EndPoints.login,
         query: {
      'email': email,
      'password': password,
      'remember_me': false,
           'identity_matrix': 'ff09d187-d544-47a3-8e3a-0c1778f254b3'

      },
      );
      print("30");

      if (response.data != null) {
        loginModel = LoginModel.fromJson(response.data);

        print("35");

        emit(LoginSuccessState(loginModel));
        print("38");
      } else {
        print("40");
        emit(LoginFailureState(errMessage: "Response data is null."));
        print("42");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      print("48");
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }

  Future<void> userLogOut( BuildContext context) async {
    emit(LogoutLoadingState());
    try {
      await DioHelper().get(endPoint: EndPoints.logOut, token: token);
      CacheHelper.removeData(key:'access_token')
          .then((value) {
        if (value) {
          Navigator.pushNamed(
            context,
            RouteName.loginScreen,
          );
        }
      });      emit(LogoutSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LogoutFailureState(errMessage: e.toString()));
    }
  }

  Future<void> userDeleteAcc() async {

    try {
      await DioHelper().get(endPoint: EndPoints.deleteProfile, token: token);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


  IconData suffixIcon = Icons.visibility;
  bool secirty = true;

  void changePasswordVisibility() {
    secirty = !secirty;
    suffixIcon =
    secirty ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
