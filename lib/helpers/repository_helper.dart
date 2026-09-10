import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/core/network/api_client.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/dio_exception.dart';

abstract class RepositoryHelper {
  final DioClient dioClient = DioClient();

  Failure _mapDioException(DioException dioError) {
    final message = DioExceptions.fromDioError(dioError).message;
    return BadRequestFailure(message);
  }

  Future<Either<Failure, T>> callApi<T>({
    required Future<Response> api,
    T Function(dynamic json)? jsonCallback,
  }) async {
    try {
      final response = await api;

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
            return right(true as T);
          }
        } else if (jsonCallback == null) {
          return right(true as T);
        } else {
          return left(const NotFoundFailure());
        }
      } else {
        final message =
            response.data['message'] ?? 'Terjadi kesalahan pada server';
        return left(BadRequestFailure(message));
      }
    } on DioException catch (dioError) {
      return left(_mapDioException(dioError));
    } catch (e) {
      return left(const UnknownFailure());
    }
  }

  Future<Either<Failure, T>> callApiWithoutData<T>({
    required Future<Response> api,
    T Function(Map<String, dynamic> responseJson)? messageMapper,
  }) async {
    try {
      final response = await api;
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
        return left(BadRequestFailure(message));
      }
    } on DioException catch (dioError) {
      return left(_mapDioException(dioError));
    } catch (e) {
      return left(const UnknownFailure());
    }
  }

  Future<Either<Failure, PaginationResult<T>>> callApiWithPaginationData<T>({
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
              ProcessingFailure(
                'Terjadi kesalahan saat memproses data list: ${e.toString()}',
              ),
            );
          }
        } else {
          return left(
            const BadRequestFailure(
              'Format data tidak valid: Tidak ditemukan list data yang sesuai.',
            ),
          );
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(BadRequestFailure(message));
      }
    } on DioException catch (dioError) {
      return left(_mapDioException(dioError));
    } on FormatException catch (formatError) {
      return left(
        ProcessingFailure(
          kDebugMode
              ? "Format data tidak valid: $formatError"
              : 'Format data tidak valid',
        ),
      );
    } catch (error) {
      return left(const UnknownFailure());
    }
  }

  Future<Either<Failure, PaginationResult<T>>>
  callApiWithListDataPaginationWithoutRequest<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      final response = await api;

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
              ProcessingFailure(
                'Terjadi kesalahan saat memproses data list: ${e.toString()}',
              ),
            );
          }
        } else {
          return left(
            const BadRequestFailure(
              'Format data tidak valid: Data tidak berupa list',
            ),
          );
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(BadRequestFailure(message));
      }
    } on DioException catch (dioError) {
      return left(_mapDioException(dioError));
    } on FormatException catch (formatError) {
      return left(
        ProcessingFailure(
          kDebugMode
              ? "Format data tidak valid: $formatError"
              : 'Format data tidak valid',
        ),
      );
    } catch (error) {
      return left(const UnknownFailure());
    }
  }

  Future<Either<Failure, bool>> callApiBool({
    required Future<Response> api,
  }) async {
    try {
      final response = await api;

      if (response.statusCode == 200 || response.statusCode == 201) {
        final success = response.data['success'];
        if (success is bool) {
          return right(success);
        }
        return right(true);
      }

      final message =
          response.data['message'] ?? 'Terjadi kesalahan pada server';
      return left(BadRequestFailure(message));
    } on DioException catch (dioError) {
      return left(_mapDioException(dioError));
    } catch (error) {
      return left(const UnknownFailure());
    }
  }
}
