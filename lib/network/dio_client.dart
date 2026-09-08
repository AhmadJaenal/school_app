import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/src/form_data.dart' as d;
import 'package:dio/src/multipart_file.dart' as dio_multipart;
import 'package:school_app/network/app_config.dart';
import 'package:school_app/session/session_key.dart';
import 'package:school_app/session/session_manager.dart';
import 'package:school_app/utils/util.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late final Dio? dio;
  final SessionManager _sessionManager = Get.find();

  DioClient._internal() {
    final baseUrlUtils = BaseUrlUtils();
    dio =
        Dio(
            BaseOptions(
              baseUrl: baseUrlUtils.getUrlDevice(),
              connectTimeout: ApiConfig.connectionTimeout,
              receiveTimeout: ApiConfig.receiveTimeout,
              sendTimeout: ApiConfig.sendTimeout,
              responseType: ResponseType.json,
              contentType: ApiConfig.contentType,
            ),
          )
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              responseHeader: false,
              responseBody: true,
              requestBody: true,
              error: true,
              request: true,
              maxWidth: 90,
            ),
          )
          ..interceptors.add(
            InterceptorsWrapper(
              onRequest: (options, handler) async {
                if (options.contentType == null ||
                    !options.contentType!.contains('multipart')) {
                  options.headers['Accept'] = 'application/json';
                }

                final token = _sessionManager.read(SessionKey.token);
                debugPrint("Read Token: $token");
                if (token != null) {
                  options.headers['X-USER-JWT'] = token;
                }

                debugPrint("Request: ${options.method} ${options.uri}");
                options.headers.forEach((key, value) {
                  debugPrint("   $key: $value");
                });

                return handler.next(options);
              },
              onError: (error, handler) async {
                debugPrint("DioError: ${error.type}");
                debugPrint("DioError Message: ${error.message}");
                debugPrint("DioError Response: ${error.response?.data}");
                return handler.next(error);
              },
              onResponse: (response, handler) async => handler.next(response),
            ),
          );
  }

  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client is not initialized");
    }
    try {
      final proccessParams = queryParameters?.map(
        (key, value) => MapEntry(key, value),
      );

      final response = await dio!.get<T>(url, queryParameters: proccessParams);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> postRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initiliazed");
    }

    try {
      final headers = <String, dynamic>{
        "Accept": "application/json",
        ...?options?.headers,
      };

      if (data is d.FormData) {
        headers['Content-Type'] = "multipart/form-data";
      }

      final mergedOptions = Options(
        headers: headers,
        responseType: options?.responseType ?? ResponseType.json,
      );

      final response = await dio!.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> deleteRequest<T>(
    String url,
    String data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }

    try {
      final response = await dio!.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> patchRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }
    try {
      final response = await dio!.patch<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> putRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }

    try {
      // Inisialisasi header dengan nilai default
      final headers = <String, dynamic>{
        "Accept": "application/json",
        ...?options?.headers,
      };

      if (data is d.FormData) {
        headers["Content-Type"] = "multipart/form-data";
      }

      final mergedOptions = Options(
        headers: headers,
        responseType: options?.responseType ?? ResponseType.json,
      );

      final response = await dio!.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> uploadPhoto<T>(
    String url, {
    required String filePath,
    Map<String, dynamic>? queryParameters,
    String fieldName = "image",
  }) async {
    if (dio == null) {
      throw Exception("Dio client not initialized");
    }

    try {
      final String fileName = filePath.split('/').last;
      final d.FormData formData = d.FormData.fromMap({
        fieldName: await dio_multipart.MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),
        ...queryParameters ?? {},
      });

      debugPrint("FormData Field: ${formData.fields}");
      debugPrint("FormData Files: ${formData.files}");

      final response = await dio!.post<T>(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
