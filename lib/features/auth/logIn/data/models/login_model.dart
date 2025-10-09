class LoginModel {
  LoginModel({
      this.accessToken, 
      this.expiresAtUtc, 
      this.refreshToken,});

  LoginModel.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    expiresAtUtc = json['expiresAtUtc'];
    refreshToken = json['refreshToken'];
  }
  String? accessToken;
  String? expiresAtUtc;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['expiresAtUtc'] = expiresAtUtc;
    map['refreshToken'] = refreshToken;
    return map;
  }

}