class LoginEntity {
  LoginEntity({this.accessToken});

  LoginEntity.fromJson(dynamic json) {
    accessToken = json['accessToken'];
  }

  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;

    return map;
  }
}
