class AccountModel {
  AccountModel({
    required this.id,
    required this.idSocial,
    required this.username,
    required this.password,
    required this.confirmCode,
    required this.avatar,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.address,
    required this.gender,
    required this.loginSession,
    required this.lastlogin,
    required this.status,
    required this.birthday,
    required this.numb,
    required this.nhucau,
    required this.tichdiem,
    required this.crush,
    this.resetToken,
    this.expResetToken,
  });
  late final int id;
  late final int idSocial;
  late final String username;
  late final String password;
  late final String confirmCode;
  late final String avatar;
  late final String fullname;
  late final String phone;
  late final String email;
  late final String address;
  late final int gender;
  late final String loginSession;
  late final String lastlogin;
  late final String status;
  late final int birthday;
  late final int numb;
  late final String nhucau;
  late final int tichdiem;
  late final String crush;
  late final Null resetToken;
  late final Null expResetToken;

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSocial = json['id_social'];
    username = json['username'];
    password = json['password'];
    confirmCode = json['confirm_code'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    loginSession = json['login_session'];
    lastlogin = json['lastlogin'];
    status = json['status'];
    birthday = json['birthday'];
    numb = json['numb'];
    nhucau = json['nhucau'];
    tichdiem = json['tichdiem'];
    crush = json['crush'];
    resetToken = null;
    expResetToken = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_social'] = idSocial;
    _data['username'] = username;
    _data['password'] = password;
    _data['confirm_code'] = confirmCode;
    _data['avatar'] = avatar;
    _data['fullname'] = fullname;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['address'] = address;
    _data['gender'] = gender;
    _data['login_session'] = loginSession;
    _data['lastlogin'] = lastlogin;
    _data['status'] = status;
    _data['birthday'] = birthday;
    _data['numb'] = numb;
    _data['nhucau'] = nhucau;
    _data['tichdiem'] = tichdiem;
    _data['crush'] = crush;
    _data['reset_token'] = resetToken;
    _data['exp_reset_token'] = expResetToken;
    return _data;
  }
}
