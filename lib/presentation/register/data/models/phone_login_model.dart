
import 'package:more_2_drive/presentation/login/data/models/user_model.dart';
class PhoneLoginModel {
  bool? error;
  String? message;
  String? token;
  int? id;

  PhoneLoginModel({this.error , this.message ,this.token, this.id});

  factory  PhoneLoginModel.fromJson(Map<String, dynamic> json) => PhoneLoginModel(
    error: json['result'] as bool?,
    message: json['message'] as String?,
    token: json['access_token'] as String?,
    id: json['user_id'] as int?
  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,
    'access_token': token,
    'user_id': id,
  };
}
