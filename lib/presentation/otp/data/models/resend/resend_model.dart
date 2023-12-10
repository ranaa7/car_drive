
import 'package:more_2_drive/presentation/login/data/models/user_model.dart';
class ResendModel {
  bool? error;
  String? message;
  int? id;

  ResendModel({this.error , this.message , this.id});

  factory  ResendModel.fromJson(Map<String, dynamic> json) => ResendModel(
      error: json['result'] as bool?,
      message: json['message'] as String?,
      id: json['user_id'] as int?
  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,
    'user_id': id,
  };
}
