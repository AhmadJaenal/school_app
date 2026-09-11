import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  const TeacherEntity({
    this.id,
    this.userId,
    this.schoolId,
    this.nip,
    this.fullName,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.address,
    this.phoneNumber,
    this.photoUrl,
    this.employmentStatus,
    this.admissionDate,
  });

  final String? id;
  final String? userId;
  final String? schoolId;
  final String? nip;
  final String? fullName;
  final String? gender;
  final String? birthPlace;
  final String? birthDate;
  final String? address;
  final String? phoneNumber;
  final String? photoUrl;
  final String? employmentStatus;
  final String? admissionDate;

  @override
  List<Object?> get props => [
    id,
    userId,
    schoolId,
    nip,
    fullName,
    gender,
    birthPlace,
    birthDate,
    address,
    phoneNumber,
    photoUrl,
    employmentStatus,
    admissionDate,
  ];
}
