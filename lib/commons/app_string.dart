class AppString {
  const AppString._();

  static const String tag = 'APP';

  // Dio Exception Messages
  static const String cancelRequest = 'Request was cancelled';
  static const String connectionTimeOut =
      'Connection timed out, please check your internet connection';
  static const String receiveTimeOut =
      'Server took too long to respond, please try again';
  static const String sendTimeOut =
      'Request timed out while sending data, please try again';
  static const String socketException =
      'No internet connection, please check your network';
  static const String unknownError =
      'An unexpected error occurred, please try again';

  // HTTP Status Code Messages
  static const String badRequest = 'Bad request, please check your input';
  static const String unauthorized = 'Unauthorized, please login again';
  static const String forbidden =
      'You do not have permission to access this resource';
  static const String notFound = 'The requested resource was not found';
  static const String duplicateEmail =
      'Email already exists, please use a different email';
  static const String internalServerError =
      'Internal server error, please try again later';
  static const String badGateway =
      'Bad gateway, the server is temporarily unavailable';
}
