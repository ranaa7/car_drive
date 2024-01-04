class GetCartListModel {
  dynamic id;
  int? ownerId;
  int? userId;
  int? productId;
  String? productName;
  String? productThumbnailImage;
  Null variation;
  dynamic price;
  String? currencySymbol;
  int? tax;
  int? shippingCost;
  dynamic quantity=1;
  int? lowerLimit;
  int? upperLimit;

  GetCartListModel(
      {this.id,
        this.ownerId,
        this.userId,
        this.productId,
        this.productName,
        this.productThumbnailImage,
        this.variation,
        this.price,
        this.currencySymbol,
        this.tax,
        this.shippingCost,
        this.quantity=1,
        this.lowerLimit,
        this.upperLimit});

  GetCartListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    upperLimit = json['upper_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner_id'] = ownerId;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_thumbnail_image'] = productThumbnailImage;
    data['variation'] = variation;
    data['price'] = price;
    data['currency_symbol'] = currencySymbol;
    data['tax'] = tax;
    data['shipping_cost'] = shippingCost;
    data['quantity'] = quantity;
    data['lower_limit'] = lowerLimit;
    data['upper_limit'] = upperLimit;
    return data;
  }
}
