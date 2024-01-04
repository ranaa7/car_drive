class UserCarsModel {
  int? id;
  String? carType;
  String? carModel;

  UserCarsModel({this.id, this.carType, this.carModel});

  UserCarsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carType = json['car_type'];
    carModel = json['car_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car_type'] = carType;
    data['car_model'] = carModel;
    return data;
  }
}
