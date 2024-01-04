class AllProductModel {
  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  Links? links;

  AllProductModel(
      {this.id,
        this.name,
        this.thumbnailImage,
        this.hasDiscount,
        this.discount,
        this.strokedPrice,
        this.mainPrice,
        this.rating,
        this.sales,
        this.links});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    rating = json['rating'];
    sales = json['sales'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['thumbnail_image'] = thumbnailImage;
    data['has_discount'] = hasDiscount;
    data['discount'] = discount;
    data['stroked_price'] = strokedPrice;
    data['main_price'] = mainPrice;
    data['rating'] = rating;
    data['sales'] = sales;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Links {
  String? details;

  Links({this.details});

  Links.fromJson(Map<String, dynamic> json) {
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['details'] = details;
    return data;
  }
}
