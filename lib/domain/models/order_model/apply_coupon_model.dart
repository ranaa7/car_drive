class ApplyCouponModel {
  bool? result;
  String? message;

  ApplyCouponModel({this.result, this.message});

  ApplyCouponModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    return data;
  }
}
