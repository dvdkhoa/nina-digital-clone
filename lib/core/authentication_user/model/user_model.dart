class UserModel {
  final int? id;
  final String? avatar;
  final String? fullname;
  final String? username;
  final String? phone;
  final String? email;
  final String? address;
  final int? gender;
  final String? status;
  final int? birthday;
  final String? crush;
  final String? deviceToken;

  UserModel({
    this.id,
    this.avatar,
    this.fullname,
    this.username,
    this.phone,
    this.email,
    this.address,
    this.gender,
    this.status,
    this.birthday,
    this.crush,
    this.deviceToken,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        avatar = json['avatar'] as String?,
        fullname = json['fullname'] as String?,
        username = json['username'] as String?,
        phone = json['phone'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        gender = int.parse(json['gender'].toString()),
        status = json['status'] as String?,
        birthday = int.parse(json['birthday'].toString()),
        crush = json['crush'] as String?,
        deviceToken = json['deviceToken'] as String?;

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'avatar': avatar,
        'fullname': fullname,
        'username': username,
        'phone': phone,
        'email': email,
        'address': address,
        'gender': gender,
        'status': status,
        'birthday': birthday,
        'crush': crush,
        'deviceToken': deviceToken
      };

  UserModel copyWith({int? id,
    String? avatar,
    String? fullname,
    String? username,
    String? phone,
    String? email,
    String? address,
    int? gender,
    String? status,
    int? birthday,
    String? crush,
    String? deviceToken}) =>
      UserModel(
          id: id ?? this.id,
          avatar: avatar ?? this.avatar,
          fullname: fullname ?? this.fullname,
          username: username ?? this.username,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          address: address ?? this.address,
          gender: gender ?? this.gender,
          status: status ?? this.status,
          birthday: birthday ?? this.birthday,
          crush: crush ?? this.crush,
          deviceToken: deviceToken ?? this.deviceToken);
}
