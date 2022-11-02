class VerifyForgotPasswordModel {
  final String email;
  final String otp;

  VerifyForgotPasswordModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'otp': otp,
    };
  }

  factory VerifyForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordModel(
      email: json['email'],
      otp: json['otp'],
    );
  }
}
