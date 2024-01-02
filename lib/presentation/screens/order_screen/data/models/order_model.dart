class PurchaseHistoryModel {
  int? id;
  String? code;
  int? userId;
  String? paymentType;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  String? grandTotal;
  String? date;

  PurchaseHistoryModel(
      {this.id,
        this.code,
        this.userId,
        this.paymentType,
        this.paymentStatus,
        this.paymentStatusString,
        this.deliveryStatus,
        this.deliveryStatusString,
        this.grandTotal,
        this.date,
        });

  PurchaseHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];
    paymentType = json['payment_type'];
    paymentStatus = json['payment_status'];
    paymentStatusString = json['payment_status_string'];
    deliveryStatus = json['delivery_status'];
    deliveryStatusString = json['delivery_status_string'];
    grandTotal = json['grand_total'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['user_id'] = userId;
    data['payment_type'] = paymentType;
    data['payment_status'] = paymentStatus;
    data['payment_status_string'] = paymentStatusString;
    data['delivery_status'] = deliveryStatus;
    data['delivery_status_string'] = deliveryStatusString;
    data['grand_total'] = grandTotal;
    data['date'] = date;

    return data;
  }
}


