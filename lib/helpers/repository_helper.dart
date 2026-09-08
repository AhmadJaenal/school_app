import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/core/network/api_client.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/dio_exception.dart';

abstract class RepositoryHelper {
  final DioClient dioClient = DioClient();

  Future<Either<Failure, T>> callApi<T>({
    required Future<Response> api,
    T Function(dynamic json)? jsonCallback,
  }) async {
    try {
      Response response = await api;

      // Cek response status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null) {
          if (jsonCallback != null) {
            try {
              return right(jsonCallback(data));
            } catch (e) {
              return left(ProcessingFailure(e.toString()));
            }
          } else {
            // Jika callback tidak diberikan, return null
            return right(true as T);
          }
        } else if (data == null && jsonCallback == null) {
          return right(true as T);
        } else {
          final message = response.data['message'] ?? NotFoundFailure();
          return left(message);
        }
      }
    } on DioException catch (dioError) {}
    throw UnknownFailure();
  }

  Future<Either<String, T>> callApiWithoutData<T>({
    required Future<Response> api,
    T Function(Map<String, dynamic> responseJson)? messageMapper,
  }) async {
    try {
      final Response response = await api;
      final statusCode = response.statusCode;
      final responseData = response.data;

      if (statusCode == 200 || statusCode == 201) {
        if (messageMapper != null) {
          return right(messageMapper(responseData));
        } else {
          return right(true as T);
        }
      } else {
        final message =
            responseData['message'] ?? 'Terjadi kesalahan pada server';
        return left(message);
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  String handleDioError(DioException exception) {
    if (exception.response?.statusCode == 401 ||
        exception.response?.statusCode == 404) {
      var errorMessage =
          exception.response?.data['message'] ?? 'Permintaan tidak valid';
      return errorMessage;
    }

    if (exception.response?.statusCode == 422) {
      var errorMessage =
          exception.response?.data['message'] ?? 'Validasi gagal';
      var validations = exception.response?.data['data'];

      if (validations != null) {
        try {
          validations.forEach((key, value) {
            errorMessage += '\n$key: ${value.join(', ')}';
          });
        } catch (e) {
          errorMessage =
              exception.response?.data['message'] ?? 'Permintaan tidak valid';
        }
      }
      return errorMessage;
    } else {
      if (exception.response?.data != null) {
        final errorMessage = exception.response?.data['message'];
        if (errorMessage != null) {
          return errorMessage;
        }
      }
      return DioExceptions.fromDioError(exception).toString();
    }
  }

  Future<Either<String, PaginationResult<T>>> callApiWithPaginationData<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      final response = await api;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final rawData = response.data['data'];
        final rawPagination = response.data['pagination'];

        List<dynamic>? extractedList;

        if (rawData is List) {
          extractedList = rawData;
        } else if (rawData is Map<String, dynamic> &&
            rawData['request'] is List) {
          extractedList = rawData['request'];
        }

        if (extractedList != null && rawPagination != null) {
          try {
            final dataList = extractedList
                .map((item) => jsonCallback(item))
                .toList();
            final pagination = PaginationInfo.fromJson(rawPagination);

            return right(
              PaginationResult(data: dataList, pagination: pagination),
            );
          } catch (e) {
            return left(
              "Terjadi kesalahan saat memproses data list: ${e.toString()}",
            );
          }
        } else {
          return left(
            'Format data tidak valid: Tidak ditemukan list data yang sesuai.',
          );
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (dioError) {
      return left(DioExceptions.fromDioError(dioError).toString());
    } on FormatException catch (formatError) {
      return left(
        kDebugMode
            ? "Format data tidak valid: $formatError"
            : 'Format data tidak valid',
      );
    } catch (error) {
      return left(
        kDebugMode ? "Terjadi kesalahan: $error" : 'Terjadi kesalahan',
      );
    }
  }

  Future<Either<String, PaginationResult<T>>>
  callApiWithListDataPaginationWithoutRequest<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      Response response = await api;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null && data is List) {
          try {
            final dataList = data.map((item) => jsonCallback(item)).toList();

            final pagination = PaginationInfo.fromJson(
              response.data['pagination'],
            );

            return right(
              PaginationResult(data: dataList, pagination: pagination),
            );
          } catch (e) {
            return left(
              "Terjadi kesalahan saat memproses data list: ${e.toString()}",
            );
          }
        } else {
          return left('Format data tidak valid: Data tidak berupa list');
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (dioError) {
      final errorMessage = DioExceptions.fromDioError(dioError).toString();
      return left(errorMessage);
    } on FormatException catch (formatError) {
      final errorMessage = kDebugMode
          ? "Format data tidak valid: $formatError"
          : 'Format data tidak valid';
      return left(errorMessage);
    } catch (error) {
      final errorMessage = kDebugMode
          ? "Terjadi kesalahan: $error"
          : 'Terjadi kesalahan';
      return left(errorMessage);
    }
  }
}
