import '../entities/attendance.dart';

abstract interface class AttendanceRepository {
  Future<List<Attendance>> getAttendance({
    int? studentId,
    String? from,
    String? to,
    int page = 1,
    int limit = 20,
  });

  Future<Attendance> checkIn({
    required int studentId,
    double? latitude,
    double? longitude,
  });

  Future<Attendance> checkOut({
    required int studentId,
    double? latitude,
    double? longitude,
  });
}
