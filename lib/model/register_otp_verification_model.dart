class RegisterOtpVerificationModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? password;

  RegisterOtpVerificationModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory RegisterOtpVerificationModel.fromJson(Map<String, dynamic> json) {
    return RegisterOtpVerificationModel(
      userName: json["username"] ?? "a",
      email: json["email"] ?? "b",
      phone: json["phone"] ?? "c",
      password: json["password"] ?? "d",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
