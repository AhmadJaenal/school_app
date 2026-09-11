import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  const StudentEntity({
    this.id,
    this.userId,
    this.schoolId,
    this.classId,
    this.studentNumber,
    this.nationalStudentNumber,
    this.fullName,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.address,
    this.phoneNumber,
    this.photoUrl,
    this.status,
    this.admissionDate,
  });

  final String? id;
  final String? userId;
  final String? schoolId;
  final String? classId;
  final String? studentNumber;
  final String? nationalStudentNumber;
  final String? fullName;
  final String? gender;
  final String? birthPlace;
  final String? birthDate;
  final String? address;
  final String? phoneNumber;
  final String? photoUrl;
  final String? status;
  final String? admissionDate;

  @override
  List<Object?> get props => [
    id,
    userId,
    schoolId,
    classId,
    studentNumber,
    nationalStudentNumber,
    fullName,
    gender,
    birthPlace,
    birthDate,
    address,
    phoneNumber,
    photoUrl,
    status,
    admissionDate,
  ];
}
