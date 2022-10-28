// class UserModel {
//   final User? user;

//   UserModel({
//     required this.user,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "user": user?.toJson(),
//     };
//   }
// }

class UserModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? password;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
