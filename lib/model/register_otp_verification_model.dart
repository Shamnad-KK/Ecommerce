class RegisterOtpVerificationModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? password;
  final String? code;

  RegisterOtpVerificationModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
    required this.code,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     userName: json["username"] ?? "a",
  //     email: json["email"] ?? "b",
  //     phone: json["phone"] ?? "c",
  //     password: json["password"] ?? "d",
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "phone": phone,
      "password": password,
      "code": code,
    };
  }
}
