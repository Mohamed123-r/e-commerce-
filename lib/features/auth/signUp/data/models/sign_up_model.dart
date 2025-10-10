class SignUpModel {
  SignUpModel({this.message});

  SignUpModel.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  SignUpModel copyWith({String? message}) =>
      SignUpModel(message: message ?? this.message);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
