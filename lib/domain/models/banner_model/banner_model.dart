class BannerModel {
  String? photo;

  BannerModel({this.photo});

  BannerModel.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    return data;
  }
}
