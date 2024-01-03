class CartSummaryModel {
  String? subTotal;
  String? tax;
  String? shippingCost;
  String? discount;
  String? grandTotal;
  int? grandTotalValue;
  String? couponCode;
  bool? couponApplied;

  CartSummaryModel(
      {this.subTotal,
        this.tax,
        this.shippingCost,
        this.discount,
        this.grandTotal,
        this.grandTotalValue,
        this.couponCode,
        this.couponApplied});

  CartSummaryModel.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    discount = json['discount'];
    grandTotal = json['grand_total'];
    grandTotalValue = json['grand_total_value'];
    couponCode = json['coupon_code'];
    couponApplied = json['coupon_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['tax'] = tax;
    data['shipping_cost'] = shippingCost;
    data['discount'] = discount;
    data['grand_total'] = grandTotal;
    data['grand_total_value'] = grandTotalValue;
    data['coupon_code'] = couponCode;
    data['coupon_applied'] = couponApplied;
    return data;
  }
}
