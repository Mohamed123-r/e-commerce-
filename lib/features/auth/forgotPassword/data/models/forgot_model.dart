class ForgotModel {
  final String email;

  ForgotModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  factory ForgotModel.fromJson(Map<String, dynamic> json) {
    return ForgotModel(
      email: json['email'],
    );
  }
}