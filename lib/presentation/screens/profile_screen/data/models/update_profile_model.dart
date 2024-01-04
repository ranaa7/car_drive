

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
