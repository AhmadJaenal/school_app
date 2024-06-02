import 'package:equatable/equatable.dart';

class ActivityStudentEntity extends Equatable {
  final int id;
  final int idStudent;
  final String activity;
  final String date;
  final String time;
  final String attendanceStatus;

  const ActivityStudentEntity({
    required this.id,
    required this.idStudent,
    required this.activity,
    required this.date,
    required this.time,
    required this.attendanceStatus,
  });

  @override
  List<Object?> get props {
    return [
      id,
      idStudent,
      activity,
      date,
      time,
      attendanceStatus,
    ];
  }
}
