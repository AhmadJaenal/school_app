import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final String id;
  final String userId;
  final String schoolId;
  final String? classId;
  final String studentNumber;
  final String nationalStudentNumber;
  final String fullName;
  final String gender;
  final String birthPlace;
  final String birthDate;
  final String address;
  final String? phoneNumber;
  final String? photoUrl;
  final String status;
  final String admissionDate;

  const StudentModel({
    required this.id,
    required this.userId,
    required this.schoolId,
    required this.classId,
    required this.studentNumber,
    required this.nationalStudentNumber,
    required this.fullName,
    required this.gender,
    required this.birthPlace,
    required this.birthDate,
    required this.address,
    this.phoneNumber,
    this.photoUrl,
    required this.status,
    required this.admissionDate,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      schoolId: json['school_id'] as String,
      classId: json['class_id'] as String?,
      studentNumber: json['student_number'] as String,
      nationalStudentNumber: json['national_student_number'] as String,
      fullName: json['full_name'] as String,
      gender: json['gender'] as String,
      birthPlace: json['birth_place'] as String,
      birthDate: json['birth_date'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'],
      photoUrl: json['photo_url'],
      status: json['status'] as String,
      admissionDate: json['admission_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'school_id': schoolId,
      'class_id': classId,
      'student_number': studentNumber,
      'national_student_number': nationalStudentNumber,
      'full_name': fullName,
      'gender': gender,
      'birth_place': birthPlace,
      'birth_date': birthDate,
      'address': address,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'status': status,
      'admission_date': admissionDate,
    };
  }

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
