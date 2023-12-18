import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';


import '../../../../../core/app_constants/constants.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    print("23");

    try {
      var response = await DioHelper.postData(
        endPoint:EndPoints.login,
         queryParameters: {
      'email': email,
      'password': password,
      'remember_me': false,
      'identity_matrix': 'ff09d187-d544-47a3-8e3a-0c1778f254b3',
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

  Future<void> userLogOut() async {
    emit(LogoutLoadingState());
    try {
      await DioHelper.postData(endPoint: EndPoints.logOut, token: token);
      emit(LogoutSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LogoutFailureState(errMessage: e.toString()));
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
