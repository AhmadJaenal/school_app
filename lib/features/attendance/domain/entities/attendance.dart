import 'package:equatable/equatable.dart';

class Attendance extends Equatable {
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

  @override
  List<Object?> get props => [
    id,
    studentId,
    date,
    status,
    classId,
    checkIn,
    checkOut,
    checkInLatitude,
    checkInLongitude,
    checkOutLatitude,
    checkOutLongitude,
    note,
    student,
  ];
}

class AttendanceStudent extends Equatable {
  const AttendanceStudent({this.id, this.name, this.nis});

  final int? id;
  final String? name;
  final String? nis;

  @override
  List<Object?> get props => [id, name, nis];
}
