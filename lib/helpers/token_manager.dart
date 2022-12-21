// ignore_for_file: constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const String REFRESH_TOKEN = 'refreshToken';
  static const String ACCESS_TOKEN = 'accessToken';

  void setTokens({
    required String refreshToken,
    required String accessToken,
  }) async {
    await storage.write(key: REFRESH_TOKEN, value: refreshToken);
    await storage.write(key: ACCESS_TOKEN, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    final accessToken = await storage.read(key: ACCESS_TOKEN);
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN);
    return refreshToken;
  }

  void deleteTokens() async {
    await storage.delete(key: ACCESS_TOKEN);
    await storage.delete(key: REFRESH_TOKEN);
  }
}
