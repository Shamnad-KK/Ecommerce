class AuthTokenModel {
  final String refreshToken;
  final String accessToken;
  AuthTokenModel({
    required this.refreshToken,
    required this.accessToken,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      refreshToken: json['refreshToken'] as String,
      accessToken: json['accessToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'refreshToken': refreshToken,
      'accessToken': accessToken,
    };
  }
}
