import 'package:school_app/features/classes/domain/entities/student_entities.dart';

class StudentModel extends StudentEntity {
  const StudentModel({
    super.id,
    super.userId,
    super.schoolId,
    super.classId,
    super.studentNumber,
    super.nationalStudentNumber,
    super.fullName,
    super.gender,
    super.birthPlace,
    super.birthDate,
    super.address,
    super.phoneNumber,
    super.photoUrl,
    super.status,
    super.admissionDate,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      schoolId: json['school_id'] as String?,
      classId: json['class_id'] as String?,
      studentNumber: json['student_number'] as String?,
      nationalStudentNumber: json['national_student_number'] as String?,
      fullName: json['full_name'] as String?,
      gender: json['gender'] as String?,
      birthPlace: json['birth_place'] as String?,
      birthDate: json['birth_date'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photoUrl: json['photo_url'] as String?,
      status: json['status'] as String?,
      admissionDate: json['admission_date'] as String?,
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
}
