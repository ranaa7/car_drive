import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/presentation/screens/login/data/models/login_model.dart';
import 'package:more_2_drive/presentation/screens/login/data/models/user_data_by_token_model.dart';
import 'package:more_2_drive/presentation/screens/profile_screen/data/models/update_profile_model.dart';

import '../../../../core/app_constants/constants.dart';
import '../../../../data/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import '../../../../utils/strings/end_points.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(BuildContext context) => BlocProvider.of(context);

  UpdateProfileModel updateProfileModel = UpdateProfileModel();
  UserDataByAccessToken userDataByAccessToken = UserDataByAccessToken();

  LoginModel loginModel = LoginModel();
  Future<void> updateProfile(
      {  required String name, required String password}) async {
    emit(UpdateProfileLoading());

    try {
      var response = await DioHelper().post(
        endPoint:EndPoints.updateProfile,

        data: {
          'id':loginModel.user?.id,
          'name': name,
          'password': password,
        },
        token: token,
      );
      if (response.data != null) {
        loginModel = LoginModel.fromJson(response.data);

        print("35");

        emit(UpdateProfileSuccess(updateProfileModel));
        print("38");
      } else {
        print("40");
        emit(UpdateProfileFailure("Response data is null."));
        print("42");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      print("48");
      emit(UpdateProfileFailure(e.toString()));
    }
  }




  getUserDataByToken() async {
    emit(getUserDataByTokenLoadingState());
    try {
      var response = await DioHelper().post(
          endPoint: EndPoints.getUserDataByToken,
          data: {'access_token': token});

      if (response.data != null) {
        userDataByAccessToken = UserDataByAccessToken.fromJson(response.data);

        emit(getUserDataByTokenSuccessState(userDataByAccessToken));
      } else {
        emit(getUserDataByTokenFailureState(
            errMessage: "Response data is null."));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(getUserDataByTokenFailureState(errMessage: e.toString()));
    }
  }




}
