
// ignore_for_file: unused_import

class SignupModel {
  bool? error;
  String? message;
  String? token;
  int? id;

  SignupModel({this.error , this.message ,this.token, this.id});

  factory  SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
      error: json['result'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      id: json['user_id'] as int?
  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,
    'token': token,
    'user_id': id,
  };
}
