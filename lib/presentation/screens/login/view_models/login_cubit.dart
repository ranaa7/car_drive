import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/core/network/local/cache_helper.dart';
import 'package:more_2_drive/data/remote/dio_helper.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';
import 'package:more_2_drive/utils/strings/routes_names.dart';

import '../../../../../core/app_constants/constants.dart';

import '../data/models/login_model.dart';
import '../data/models/user_data_by_token_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();
  UserDataByAccessToken userDataByAccessToken = UserDataByAccessToken();

  userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      var response = await DioHelper().post(
        endPoint: EndPoints.login,
        query: {
          'email': email,
          'password': password,
          'remember_me': false,
          'identity_matrix': 'ff09d187-d544-47a3-8e3a-0c1778f254b3'
        },
      );

      if (response.data != null) {
        loginModel = LoginModel.fromJson(response.data);

        emit(LoginSuccessState(loginModel));
      } else {
        emit(LoginFailureState(errMessage: "Response data is null."));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }





  getSocialLoginResponse(
    String social_provider,
    String name,
    String email,
    String provider, {
    access_token = "",
    secret_token = "",
  }) async {
    email = email == ("null") ? "" : email;
    emit(LoginLoadingState());
    try {
      var response =
          await DioHelper().post(endPoint: EndPoints.socialLogin, data: {
        "name": name,
        "email": email,
        "provider": "$provider",
        "social_provider": "$social_provider",
        "access_token": "$access_token",
        "secret_token": "$secret_token"
      });
      if (response.data != null) {
        loginModel = LoginModel.fromJson(response.data);

        emit(LoginSuccessState(loginModel));
      } else {
        emit(LoginFailureState(errMessage: "Response data is null."));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }




  Future<void> userLogOut(BuildContext context) async {
    emit(LogoutLoadingState());
    try {
      await DioHelper().get(endPoint: EndPoints.logOut, token: token);
      CacheHelper.removeData(key: 'access_token').then((value) {
        if (value) {
          Navigator.pushNamed(
            context,
            RouteName.loginScreen,
          );
        }
      });
      emit(LogoutSuccessState());
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
