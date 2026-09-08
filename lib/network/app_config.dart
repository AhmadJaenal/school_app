class ApiConfig {
  ApiConfig._();

  static const receiveTimeout = Duration(milliseconds: 15000);
  static const connectionTimeout = Duration(milliseconds: 15000);
  static const sendTimeout = Duration(milliseconds: 15000);
  static const contentType = "application/json; charset=utf-8";
}
