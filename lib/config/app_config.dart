class AppConfig {
  static Map<String, String> getApiHeader({
    String? token,
  }) {
    if (token != null) {
      return {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
    }
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
