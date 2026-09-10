import 'package:school_app/core/presentation/bloc/app_cubit.dart';
import 'package:school_app/features/attendance/domain/entities/attendance.dart';
import 'package:school_app/features/attendance/domain/usecases/get_attendance.dart';

class AttendanceCubit extends AppCubit<List<Attendance>> {
  AttendanceCubit(this._getAttendance);

  final GetAttendance _getAttendance;

  Future<void> load({int? studentId, String? from, String? to}) =>
      run(() => _getAttendance(studentId: studentId, from: from, to: to));
}
