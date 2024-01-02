
import 'package:more_2_drive/presentation/screens/login/data/models/user_model.dart';

class UpdateProfileModel {
  bool? error;
  String? message;


  UpdateProfileModel({this.error , this.message });

  factory  UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    error: json['result'] as bool?,
    message: json['message'] as String?,

  );

  Map<String, dynamic> toJson() => {
    'result':error,
    'message':message,

  };
}
