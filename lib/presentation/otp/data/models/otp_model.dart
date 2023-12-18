
// ignore_for_file: unused_import

import 'package:more_2_drive/presentation/otp/data/models/data_model.dart';
class OtpModel {
  bool? error;
  String? message;
  DataModel? data;

  OtpModel({this.error , this.message ,this.data});

  factory  OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
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
