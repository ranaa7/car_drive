class ClubpointsModel {
  int? id;
  int? userId;
  String? orderCode;
  int? convertibleClubPoint;
  int? points;
  int? convertStatus;
  String? date;

  ClubpointsModel(
      {this.id,
        this.userId,
        this.orderCode,
        this.convertibleClubPoint,
        this.points,
        this.convertStatus,
        this.date});

  ClubpointsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderCode = json['order_code'];
    convertibleClubPoint = json['convertible_club_point'];
    points = json['points'];
    convertStatus = json['convert_status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['order_code'] = orderCode;
    data['convertible_club_point'] = convertibleClubPoint;
    data['points'] = points;
    data['convert_status'] = convertStatus;
    data['date'] = date;
    return data;
  }
}