


class ResponseModel {
  dynamic success;
  dynamic message;
  dynamic messageAr;
   Map<String,dynamic> data={};

  ResponseModel.fromJson(Map<String,dynamic> json) {
    success = json['success'];
    message = json['message'];
    messageAr = json['messageAR'];
    data = json;
  }
}
