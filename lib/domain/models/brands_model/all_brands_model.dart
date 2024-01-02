class AllBrandsModel {
  int? id;
  String? name;
  String? logo;

  AllBrandsModel({this.id, this.name, this.logo});

  AllBrandsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    return data;
  }
}
