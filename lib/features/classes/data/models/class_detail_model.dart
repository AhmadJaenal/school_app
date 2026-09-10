import 'package:equatable/equatable.dart';
import 'package:school_app/features/classes/data/models/accademic_model.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';

class DetailClassModel extends Equatable {
  final String id;
  final String schoolId;
  final String academicYearId;
  final String className;
  final String gradeLevel;
  final String homeroomTeacherId;
  final int capacity;
  final AcademicYear academicYear;
  final HomeroomTeacher homeroomTeacher;
  final List<StudentModel> students;

  const DetailClassModel({
    required this.id,
    required this.schoolId,
    required this.academicYearId,
    required this.className,
    required this.gradeLevel,
    required this.homeroomTeacherId,
    required this.capacity,
    required this.academicYear,
    required this.homeroomTeacher,
    required this.students,
  });

  factory DetailClassModel.fromJson(Map<String, dynamic> json) {
    return DetailClassModel(
      id: json['id'] as String,
      schoolId: json['school_id'] as String,
      academicYearId: json['academic_year_id'] as String,
      className: json['class_name'] as String,
      gradeLevel: json['grade_level'] as String,
      homeroomTeacherId: json['homeroom_teacher_id'] as String,
      capacity: json['capacity'] as int,
      academicYear: AcademicYear.fromJson(
        json['academic_year'] as Map<String, dynamic>,
      ),
      homeroomTeacher: HomeroomTeacher.fromJson(
        json['homeroom_teacher'] as Map<String, dynamic>,
      ),
      students: json['students'] == null
          ? <StudentModel>[]
          : (json['students'] as List<dynamic>)
                .map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
                .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'academic_year_id': academicYearId,
      'class_name': className,
      'grade_level': gradeLevel,
      'homeroom_teacher_id': homeroomTeacherId,
      'capacity': capacity,
      'academic_year': academicYear.toJson(),
      'homeroom_teacher': homeroomTeacher.toJson(),
      'students': students.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    schoolId,
    academicYearId,
    className,
    gradeLevel,
    homeroomTeacherId,
    capacity,
    academicYear,
    homeroomTeacher,
    students,
  ];
}

class HomeroomTeacher extends Equatable {
  final String id;
  final String userId;
  final String schoolId;
  final String nip;
  final String fullName;
  final String gender;
  final String? birthPlace;
  final String birthDate;
  final String? address;
  final String phoneNumber;
  final String? photoUrl;
  final String employmentStatus;
  final String admissionDate;

  const HomeroomTeacher({
    required this.id,
    required this.userId,
    required this.schoolId,
    required this.nip,
    required this.fullName,
    required this.gender,
    this.birthPlace,
    required this.birthDate,
    this.address,
    required this.phoneNumber,
    this.photoUrl,
    required this.employmentStatus,
    required this.admissionDate,
  });

  factory HomeroomTeacher.fromJson(Map<String, dynamic> json) {
    return HomeroomTeacher(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      schoolId: json['school_id'] as String,
      nip: json['nip'] as String,
      fullName: json['full_name'] as String,
      gender: json['gender'] as String,
      birthPlace: json['birth_place'],
      birthDate: json['birth_date'] as String,
      address: json['address'],
      phoneNumber: json['phone_number'] as String,
      photoUrl: json['photo_url'],
      employmentStatus: json['employment_status'] as String,
      admissionDate: json['admission_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'school_id': schoolId,
      'nip': nip,
      'full_name': fullName,
      'gender': gender,
      'birth_place': birthPlace,
      'birth_date': birthDate,
      'address': address,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'employment_status': employmentStatus,
      'admission_date': admissionDate,
    };
  }

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
