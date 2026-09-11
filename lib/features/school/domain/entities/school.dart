import 'package:equatable/equatable.dart';

class SchoolEntity extends Equatable {
  const SchoolEntity({
    this.id,
    this.groupId,
    this.schoolName,
    this.npsn,
    this.educationLevel,
    this.address,
    this.phoneNumber,
    this.email,
    this.logoUrl,
    this.isActive,
    this.classesCount,
    this.teachersCount,
    this.studentsCount,
  });
  final String? id;
  final int? groupId;
  final String? schoolName;
  final String? npsn;
  final String? educationLevel;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? logoUrl;
  final bool? isActive;
  final int? classesCount;
  final int? teachersCount;
  final int? studentsCount;

  @override
  List<Object?> get props => [
    id,
    groupId,
    schoolName,
    npsn,
    educationLevel,
    address,
    phoneNumber,
    email,
    logoUrl,
    isActive,
    classesCount,
    teachersCount,
    studentsCount,
  ];
}
