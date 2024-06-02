import 'package:school_app/features/student/domain/entities/activity.dart';

class ActivityModel extends ActivityStudentEntity {
  const ActivityModel({
    required super.id,
    required super.idStudent,
    required super.activity,
    required super.date,
    required super.time,
    required super.attendanceStatus,
  }) : super();

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json["id"],
      idStudent: json["id_student"],
      activity: json["activity"],
      date: json["date"],
      time: json["time"],
      attendanceStatus: json["attendance_status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "id_student": idStudent,
      "activity": activity,
      "date": date,
      "time": time,
      "attendance_status": attendanceStatus,
    };
  }
}
