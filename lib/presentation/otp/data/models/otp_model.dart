
import 'package:more_2_drive/presentation/login/data/models/user_model.dart';
import 'package:more_2_drive/presentation/otp/data/models/data_model.dart';
class otpModel {
  bool? error;
  String? message;
  DataModel? data;

  otpModel({this.error , this.message ,this.data});

  factory  otpModel.fromJson(Map<String, dynamic> json) => otpModel(
    error: json['result'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : DataModel.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,
    'data':data?.toJson()

  };
}
