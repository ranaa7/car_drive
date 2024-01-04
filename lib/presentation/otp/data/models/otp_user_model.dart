class UserOtpData {
  int? id;
  String? fname;
  String? secname;
  String? mobileNumber;
  String? email;


  UserOtpData({
    this.id,
    this.fname,
    this.secname,
    this.mobileNumber,
    this.email,

  });

  factory UserOtpData.fromJson(Map<String, dynamic> json) => UserOtpData(
    id: json['id'] as int?,
    fname: json['name'] as String?,
    secname: json['secname'] as String?,
    mobileNumber: json['phone']as String? ,
    email: json['email'] as String?,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fname': fname,
    'secname':secname,
    'phone': mobileNumber,
    'email': email,

  };
}
