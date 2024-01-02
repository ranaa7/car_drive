class StateByCountryModel {
  int? id;
  int? countryId;
  String? name;

  StateByCountryModel({this.id, this.countryId, this.name});

  StateByCountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_id'] = countryId;
    data['name'] = name;
    return data;
  }
}
