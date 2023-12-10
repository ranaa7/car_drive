
// ignore_for_file: unused_import

import 'package:more_2_drive/presentation/login/data/models/user_model.dart';

import 'otp_user_model.dart';
class DataModel {
  String? token;
  UserOtpData? userOtp;

  DataModel({this.token, this.userOtp});

  factory  DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    token: json['access_token'] as String?,
    userOtp: json['user'] == null
        ? null
        : UserOtpData.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'access_token': token,
    'user': userOtp?.toJson(),
  };
}
