class CarBrandModel {
  dynamic id;
  dynamic types;
  dynamic status;

  CarBrandModel({this.id, this.types, this.status});

  CarBrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    types = json['types'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['types'] = types;
    data['status'] = status;
    return data;
  }
}
