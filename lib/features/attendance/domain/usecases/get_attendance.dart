import '../entities/attendance.dart';
import '../repositories/attendance_repository.dart';

class GetAttendance {
  GetAttendance(this._repository);

  final AttendanceRepository _repository;

  Future<List<Attendance>> call({
    int? studentId,
    String? from,
    String? to,
    int page = 1,
    int limit = 20,
  }) {
    return _repository.getAttendance(
      studentId: studentId,
      from: from,
      to: to,
      page: page,
      limit: limit,
    );
  }
}
