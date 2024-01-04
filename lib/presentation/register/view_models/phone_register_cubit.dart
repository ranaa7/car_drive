import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:more_2_drive/utils/strings/end_points.dart';


import '../../../core/network/remote/dio_helper.dart';
import '../data/models/phone_login_model.dart';

part 'phone_register_state.dart';

class PhoneRegisterCubit extends Cubit<PhoneRegisterState> {
  PhoneRegisterCubit() : super(PhoneRegisterInitial());
  static PhoneRegisterCubit get(BuildContext context) => BlocProvider.of(context);

  PhoneLoginModel phoneLoginModel =  PhoneLoginModel();



  Future<void> phoneLogin({required String fname , required String secname ,required String phone}) async {
  emit(PhoneRegisterLoadingState());
  print("23");

  try {
  var response = await DioHelper.postData(
  endPoint:EndPoints.loginPhone,
  queryParameters: {
  'name': fname,
  'secondname': secname,
  'phone': phone,
  },

  );
  print("30");

  if (response.data != null) {
  phoneLoginModel = PhoneLoginModel.fromJson(response.data);

  print("35");

  emit(PhoneRegisterSuccessState(phoneLoginModel));
  print("38");
  } else {
  print("40");
  emit(PhoneRegisterFailureState(errMessage: "Response data is null."));
  print("42");
  }
  } catch (e) {
  if (kDebugMode) {
  print(e.toString());
  }
  print("48");
  emit(PhoneRegisterFailureState(errMessage: e.toString()));
  }
}


}
