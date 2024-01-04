class PickupModel {
  int? id;
  dynamic staffId;
  String? name;
  String? address;
  String? phone;
  int? pickUpStatus;
  dynamic cashOnPickupStatus;

  PickupModel(
      {this.id,
        this.staffId,
        this.name,
        this.address,
        this.phone,
        this.pickUpStatus,
        this.cashOnPickupStatus});

  PickupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    pickUpStatus = json['pick_up_status'];
    cashOnPickupStatus = json['cash_on_pickup_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['staff_id'] = staffId;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['pick_up_status'] = pickUpStatus;
    data['cash_on_pickup_status'] = cashOnPickupStatus;
    return data;
  }
}
