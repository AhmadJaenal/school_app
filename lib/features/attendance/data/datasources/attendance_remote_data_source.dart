import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/attendance/data/models/attendance_model.dart';
import 'package:school_app/helpers/repository_helper.dart';
import 'package:school_app/models/pagination_model.dart';
import 'package:school_app/network/urls.dart';

abstract class AttendanceRemoteDataSource {
  Future<Either<Failure, PaginationResult<AttendanceModel>>> getAttendance({
    int? studentId,
    String? from,
    String? to,
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, AttendanceModel>> checkIn({
    required int studentId,
    double? latitude,
    double? longitude,
  });

  Future<Either<Failure, AttendanceModel>> checkOut({
    required int studentId,
    double? latitude,
    double? longitude,
  });
}

class AttendanceRemoteDataSourceImpl extends RepositoryHelper
    implements AttendanceRemoteDataSource {
  @override
  Future<Either<Failure, PaginationResult<AttendanceModel>>> getAttendance({
    int? studentId,
    String? from,
    String? to,
    int page = 1,
    int limit = 20,
  }) {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
      if (studentId != null) 'student_id': studentId,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
    };

    return callApiWithPaginationData(
      api: dioClient.getRequest(
        URLs.attendance,
        queryParameters: queryParameters,
      ),
      jsonCallback: (json) => AttendanceModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, AttendanceModel>> checkIn({
    required int studentId,
    double? latitude,
    double? longitude,
  }) {
    return callApi(
      api: dioClient.postRequest(
        URLs.attendanceCheckIn,
        data: {
          'student_id': studentId,
          if (latitude != null) 'latitude': latitude,
          if (longitude != null) 'longitude': longitude,
        },
      ),
      jsonCallback: (json) => AttendanceModel.fromJson(json),
    );
  }

  @override
  Future<Either<Failure, AttendanceModel>> checkOut({
    required int studentId,
    double? latitude,
    double? longitude,
  }) {
    return callApi(
      api: dioClient.postRequest(
        URLs.attendanceCheckOut,
        data: {
          'student_id': studentId,
          if (latitude != null) 'latitude': latitude,
          if (longitude != null) 'longitude': longitude,
        },
      ),
      jsonCallback: (json) => AttendanceModel.fromJson(json),
    );
  }
}
