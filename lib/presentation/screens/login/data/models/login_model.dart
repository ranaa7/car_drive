
import 'package:more_2_drive/presentation/screens/login/data/models/user_model.dart';

class LoginModel {
  bool? error;
  String? message;
  String? token;
  UserData? user;

  LoginModel({this.error , this.message ,this.token, this.user});

  factory  LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    error: json['result'] as bool?,
    message: json['message'] as String?,
    token: json['access_token'] as String?,
    user: json['user'] == null
        ? null
        : UserData.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,
    'access_token': token,
    'user': user?.toJson(),
  };
}
