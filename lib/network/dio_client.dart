import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:school_app/network/app_config.dart';
import 'package:school_app/session/session_key.dart';
import 'package:school_app/session/session_manager.dart';
import 'package:school_app/utils/util.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio? dio;

  SessionManager get _sessionManager {
    if (GetIt.I.isRegistered<SessionManager>()) {
      return GetIt.I<SessionManager>();
    }
    if (Get.isRegistered<SessionManager>()) {
      return Get.find<SessionManager>();
    }
    throw StateError('SessionManager belum didaftarkan');
  }

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
                if (token != null) {
                  options.headers['X-USER-JWT'] = token;
                }
                return handler.next(options);
              },
              onError: (error, handler) async => handler.next(error),
              onResponse: (response, handler) async => handler.next(response),
            ),
          );
  }

  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }
    return client.get<T>(url, queryParameters: queryParameters);
  }

  Future<Response<T>> postRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }

    final headers = <String, dynamic>{
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (data is FormData) {
      headers['Content-Type'] = 'multipart/form-data';
    }

    return client.post<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        responseType: options?.responseType ?? ResponseType.json,
      ),
    );
  }

  Future<Response<T>> deleteRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }
    return client.delete<T>(url, data: data, queryParameters: queryParameters);
  }

  Future<Response<T>> patchRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }
    return client.patch<T>(url, data: data, queryParameters: queryParameters);
  }

  Future<Response<T>> putRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }

    final headers = <String, dynamic>{
      'Accept': 'application/json',
      ...?options?.headers,
    };
    if (data is FormData) {
      headers['Content-Type'] = 'multipart/form-data';
    }

    return client.put<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        responseType: options?.responseType ?? ResponseType.json,
      ),
    );
  }

  Future<Response<T>> uploadPhoto<T>(
    String url, {
    required String filePath,
    Map<String, dynamic>? queryParameters,
    String fieldName = 'image',
  }) async {
    final client = dio;
    if (client == null) {
      throw StateError('Dio client is not initialized');
    }

    final fileName = filePath.split('/').last;
    final formData = FormData.fromMap({
      fieldName: await MultipartFile.fromFile(filePath, filename: fileName),
      ...?queryParameters,
    });

    return client.post<T>(
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
  }
}
