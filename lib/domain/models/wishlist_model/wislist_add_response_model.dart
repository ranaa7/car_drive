class WishlistAddResponseModel {
  String? message;
  bool? isInWishlist;
  int? productId;
  int? wishlistId;

  WishlistAddResponseModel(
      {this.message, this.isInWishlist, this.productId, this.wishlistId});

  WishlistAddResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isInWishlist = json['is_in_wishlist'];
    productId = json['product_id'];
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_in_wishlist'] = isInWishlist;
    data['product_id'] = productId;
    data['wishlist_id'] = wishlistId;
    return data;
  }
}
