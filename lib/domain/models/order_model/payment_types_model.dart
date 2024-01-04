class PaymentTypesModel {
  String? paymentType;
  String? paymentTypeKey;
  String? image;
  String? name;
  String? title;
  int? offlinePaymentId;
  String? details;

  PaymentTypesModel(
      {this.paymentType,
        this.paymentTypeKey,
        this.image,
        this.name,
        this.title,
        this.offlinePaymentId,
        this.details});

  PaymentTypesModel.fromJson(Map<String, dynamic> json) {
    paymentType = json['payment_type'];
    paymentTypeKey = json['payment_type_key'];
    image = json['image'];
    name = json['name'];
    title = json['title'];
    offlinePaymentId = json['offline_payment_id'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_type'] = paymentType;
    data['payment_type_key'] = paymentTypeKey;
    data['image'] = image;
    data['name'] = name;
    data['title'] = title;
    data['offline_payment_id'] = offlinePaymentId;
    data['details'] = details;
    return data;
  }
}
