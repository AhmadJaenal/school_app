class Attendance {
  const Attendance({
    required this.id,
    required this.studentId,
    required this.date,
    required this.status,
    this.classId,
    this.checkIn,
    this.checkOut,
    this.checkInLatitude,
    this.checkInLongitude,
    this.checkOutLatitude,
    this.checkOutLongitude,
    this.note,
    this.student,
  });

  final int id;
  final int studentId;
  final String date;
  final String status;
  final int? classId;
  final String? checkIn;
  final String? checkOut;
  final double? checkInLatitude;
  final double? checkInLongitude;
  final double? checkOutLatitude;
  final double? checkOutLongitude;
  final String? note;
  final AttendanceStudent? student;
}

class AttendanceStudent {
  const AttendanceStudent({this.id, this.name, this.nis});

  final int? id;
  final String? name;
  final String? nis;
}
