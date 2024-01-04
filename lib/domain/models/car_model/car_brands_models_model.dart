class CarBrandsModelsModel {
  dynamic id;
  dynamic carModel;
  dynamic carTypeId;
  dynamic status;

  CarBrandsModelsModel({this.id, this.carModel, this.carTypeId, this.status});

  CarBrandsModelsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carModel = json['carModel '];
    carTypeId = json['car_type_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['carModel '] = carModel;
    data['car_type_id'] = carTypeId;
    data['status'] = status;
    return data;
  }
}
