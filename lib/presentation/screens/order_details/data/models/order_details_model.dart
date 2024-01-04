class orderDetails {
  int? id;
  String? code;
  int? userId;
  List<dynamic>? shippingAddress;
  String? paymentType;
  PickupPoint? pickupPoint;
  String? pickupPointLocation;
  dynamic pickUpTime;
  String? shippingType;
  String? shippingTypeString;
  String? paymentStatus;
  String? paymentStatusString;
  String? deliveryStatus;
  String? deliveryStatusString;
  String? grandTotal;
  int? planeGrandTotal;
  String? couponDiscount;
  String? shippingCost;
  String? subtotal;
  String? tax;
  String? date;


  orderDetails(
      {this.id,
        this.code,
        this.userId,
        this.shippingAddress,
        this.paymentType,
        this.pickupPoint,
        this.pickupPointLocation,
        this.pickUpTime,
        this.shippingType,
        this.shippingTypeString,
        this.paymentStatus,
        this.paymentStatusString,
        this.deliveryStatus,
        this.deliveryStatusString,
        this.grandTotal,
        this.planeGrandTotal,
        this.couponDiscount,
        this.shippingCost,
        this.subtotal,
        this.tax,
        this.date,

        });

  orderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userId = json['user_id'];

    shippingAddress = json['shipping_address'] as List<dynamic>;

    paymentType = json['payment_type'];
    pickupPoint = json['pickup_point'] != null
        ? PickupPoint.fromJson(json['pickup_point'])
        : null;
    pickupPointLocation = json['pickup_point_location'];
    pickUpTime = json['pick_up_time'] as dynamic;
    shippingType = json['shipping_type'];
    shippingTypeString = json['shipping_type_string'];
    paymentStatus = json['payment_status'];
    paymentStatusString = json['payment_status_string'];
    deliveryStatus = json['delivery_status'];
    deliveryStatusString = json['delivery_status_string'];
    grandTotal = json['grand_total'];
    planeGrandTotal = json['plane_grand_total'];
    couponDiscount = json['coupon_discount'];
    shippingCost = json['shipping_cost'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    date = json['date'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['user_id'] = userId;
    if (shippingAddress != null) {
      data['shipping_address'] =
          shippingAddress!.map((v) => v.toJson()).toList();
    }
    data['payment_type'] = paymentType;
    if (pickupPoint != null) {
      data['pickup_point'] = pickupPoint!.toJson();
    }
    data['pickup_point_location'] = pickupPointLocation;
    data['pick_up_time'] = pickUpTime;
    data['shipping_type'] = shippingType;
    data['shipping_type_string'] = shippingTypeString;
    data['payment_status'] = paymentStatus;
    data['payment_status_string'] = paymentStatusString;
    data['delivery_status'] = deliveryStatus;
    data['delivery_status_string'] = deliveryStatusString;
    data['grand_total'] = grandTotal;
    data['plane_grand_total'] = planeGrandTotal;
    data['coupon_discount'] = couponDiscount;
    data['shipping_cost'] = shippingCost;
    data['subtotal'] = subtotal;
    data['tax'] = tax;
    data['date'] = date;


    return data;
  }
}

class PickupPoint {
  int? id;
  String? name;
  String? address;



  PickupPoint(
      {this.id,
        this.name,
        this.address,

      });

  PickupPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;


    return data;
  }
}


