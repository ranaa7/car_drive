class DetailsOfProductModel {
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<Photos>? photos;
  String? thumbnailImage;
  String? priceHighLow;
  bool? hasDiscount;
  String? discount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  Brand? brand;
  String? link;

  DetailsOfProductModel(
      {this.id,
        this.name,
        this.addedBy,
        this.sellerId,
        this.shopId,
        this.shopName,
        this.shopLogo,
        this.photos,
        this.thumbnailImage,
        this.priceHighLow,

        this.hasDiscount,
        this.discount,
        this.strokedPrice,
        this.mainPrice,
        this.calculablePrice,
        this.currencySymbol,
        this.currentStock,
        this.unit,
        this.rating,
        this.ratingCount,
        this.earnPoint,
        this.description,
        this.videoLink,
        this.brand,
        this.link});

  DetailsOfProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    priceHighLow = json['price_high_low'];
    hasDiscount = json['has_discount'];
    discount = json['discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
    videoLink = json['video_link'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['added_by'] = addedBy;
    data['seller_id'] = sellerId;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['shop_logo'] = shopLogo;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_image'] = thumbnailImage;
    data['price_high_low'] = priceHighLow;
    data['has_discount'] = hasDiscount;
    data['discount'] = discount;
    data['stroked_price'] = strokedPrice;
    data['main_price'] = mainPrice;
    data['calculable_price'] = calculablePrice;
    data['currency_symbol'] = currencySymbol;
    data['current_stock'] = currentStock;
    data['unit'] = unit;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    data['earn_point'] = earnPoint;
    data['description'] = description;
    data['video_link'] = videoLink;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['link'] = link;
    return data;
  }
}

class Photos {
  String? variant;
  String? path;

  Photos({this.variant, this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant'] = variant;
    data['path'] = path;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? logo;

  Brand({this.id, this.name, this.logo});

  Brand.fromJson(Map<String, dynamic> json) {
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
