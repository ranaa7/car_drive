class UserDataByAccessToken {
  bool? result;
  int? id;
  String? name;
  String? email;
  Null? avatar;
  String? avatarOriginal;
  String? phone;

  UserDataByAccessToken(
      {this.result,
        this.id,
        this.name,
        this.email,
        this.avatar,
        this.avatarOriginal,
        this.phone});

  UserDataByAccessToken.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['result'] = result;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['avatar_original'] = avatarOriginal;
    data['phone'] = phone;
    return data;
  }
}