import '../entities/attendance.dart';
import '../repositories/attendance_repository.dart';

class CheckOut {
  CheckOut(this._repository);

  final AttendanceRepository _repository;

  Future<Attendance> call({
    required int studentId,
    double? latitude,
    double? longitude,
  }) {
    return _repository.checkOut(
      studentId: studentId,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
