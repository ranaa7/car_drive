class CartCountModel {
  int? count;
  bool? status;

  CartCountModel({this.count, this.status});

  CartCountModel.fromJson(dynamic json) {
    count = json['count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['status'] = status;
    return data;
  }
}
