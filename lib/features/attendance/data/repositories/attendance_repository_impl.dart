import 'package:school_app/features/attendance/data/datasources/attendance_remote_data_source.dart';
import 'package:school_app/features/attendance/domain/entities/attendance.dart';
import 'package:school_app/features/attendance/domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  AttendanceRepositoryImpl(this._remoteDataSource);

  final AttendanceRemoteDataSource _remoteDataSource;

  @override
  Future<List<Attendance>> getAttendance({
    int? studentId,
    String? from,
    String? to,
    int page = 1,
    int limit = 20,
  }) async {
    final result = await _remoteDataSource.getAttendance(
      studentId: studentId,
      from: from,
      to: to,
      page: page,
      limit: limit,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (page) => page.data,
    );
  }

  @override
  Future<Attendance> checkIn({
    required int studentId,
    double? latitude,
    double? longitude,
  }) async {
    final result = await _remoteDataSource.checkIn(
      studentId: studentId,
      latitude: latitude,
      longitude: longitude,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (attendance) => attendance,
    );
  }

  @override
  Future<Attendance> checkOut({
    required int studentId,
    double? latitude,
    double? longitude,
  }) async {
    final result = await _remoteDataSource.checkOut(
      studentId: studentId,
      latitude: latitude,
      longitude: longitude,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (attendance) => attendance,
    );
  }
}
