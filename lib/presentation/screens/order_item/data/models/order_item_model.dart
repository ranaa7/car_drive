class OrderDetailsItem {
  int? id;
  int? productId;
  String? productName;

  String? price;
  String? tax;
  String? shippingCost;
  String? couponDiscount;
  int? quantity;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  bool? refundSection;
  bool? refundButton;
  String? refundLabel;
  int? refundRequestStatus;

  OrderDetailsItem(
      {this.id,
        this.productId,
        this.productName,

        this.price,
        this.tax,
        this.shippingCost,
        this.couponDiscount,
        this.quantity,
        this.paymentStatus,
        this.paymentStatusString,
        this.deliveryStatus,
        this.deliveryStatusString,
        this.refundSection,
        this.refundButton,
        this.refundLabel,
        this.refundRequestStatus});

  OrderDetailsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    couponDiscount = json['coupon_discount'];
    quantity = json['quantity'];
    paymentStatus = json['payment_status'];
    paymentStatusString = json['payment_status_string'];
    deliveryStatus = json['delivery_status'];
    deliveryStatusString = json['delivery_status_string'];
    refundSection = json['refund_section'];
    refundButton = json['refund_button'];
    refundLabel = json['refund_label'];
    refundRequestStatus = json['refund_request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['price'] = price;
    data['tax'] = tax;
    data['shipping_cost'] = shippingCost;
    data['coupon_discount'] = couponDiscount;
    data['quantity'] = quantity;
    data['payment_status'] = paymentStatus;
    data['payment_status_string'] = paymentStatusString;
    data['delivery_status'] = deliveryStatus;
    data['delivery_status_string'] = deliveryStatusString;
    data['refund_section'] = refundSection;
    data['refund_button'] = refundButton;
    data['refund_label'] = refundLabel;
    data['refund_request_status'] = refundRequestStatus;
    return data;
  }
}