import '../../domain/entities/attendance.dart';

class AttendanceModel extends Attendance {
  const AttendanceModel({
    required super.id,
    required super.studentId,
    required super.date,
    required super.status,
    super.classId,
    super.checkIn,
    super.checkOut,
    super.checkInLatitude,
    super.checkInLongitude,
    super.checkOutLatitude,
    super.checkOutLongitude,
    super.note,
    super.student,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    final studentJson = json['student'];
    return AttendanceModel(
      id: (json['id'] as num).toInt(),
      studentId: (json['student_id'] as num).toInt(),
      date: json['tanggal'] as String? ?? '',
      status: json['status'] as String? ?? '',
      classId: (json['class_id'] as num?)?.toInt(),
      checkIn: json['jam_masuk'] as String?,
      checkOut: json['jam_keluar'] as String?,
      checkInLatitude: (json['lat_masuk'] as num?)?.toDouble(),
      checkInLongitude: (json['lng_masuk'] as num?)?.toDouble(),
      checkOutLatitude: (json['lat_keluar'] as num?)?.toDouble(),
      checkOutLongitude: (json['lng_keluar'] as num?)?.toDouble(),
      note: json['keterangan'] as String?,
      student: studentJson is Map<String, dynamic>
          ? AttendanceStudentModel.fromJson(studentJson)
          : null,
    );
  }
}

class AttendanceStudentModel extends AttendanceStudent {
  const AttendanceStudentModel({super.id, super.name, super.nis});

  factory AttendanceStudentModel.fromJson(Map<String, dynamic> json) {
    return AttendanceStudentModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['nama_lengkap'] as String? ?? json['name'] as String?,
      nis: json['nis'] as String?,
    );
  }
}
