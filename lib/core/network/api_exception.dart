import 'package:dio/dio.dart';

class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode, this.errors});

  factory ApiException.fromDio(DioException exception) {
    final response = exception.response;
    final body = response?.data;
    return ApiException(
      body is Map<String, dynamic>
          ? body['message'] as String? ?? exception.message ?? 'Request gagal.'
          : exception.message ?? 'Request gagal.',
      statusCode: response?.statusCode,
      errors: body is Map<String, dynamic> && body['errors'] is Map
          ? Map<String, dynamic>.from(body['errors'] as Map)
          : null,
    );
  }

  final String message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
