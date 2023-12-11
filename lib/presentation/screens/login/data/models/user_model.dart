class UserData {
  int? id;
  String? username;
  String? mobileNumber;
  String? email;


  UserData({
    this.id,
    this.username,
    this.mobileNumber,
    this.email,

  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'] as int?,
    username: json['name'] as String?,
    mobileNumber: json['phone']as String? ,
    email: json['email'] as String?,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': username,
    'phone': mobileNumber,
    'email': email,

  };
}
