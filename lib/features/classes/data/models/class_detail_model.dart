import 'package:school_app/features/classes/data/models/accademic_model.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';
import 'package:school_app/features/classes/domain/entities/class_entities.dart';
import 'package:school_app/features/classes/domain/entities/student_entities.dart';
import 'package:school_app/features/classes/domain/entities/teacher_entities.dart';

class DetailClassModel extends ClassDetailEntity {
  const DetailClassModel({
    super.id,
    super.schoolId,
    super.academicYearId,
    super.name,
    super.gradeLevel,
    super.homeroomTeacherId,
    super.capacity,
    super.academicYear,
    super.homeroomTeacher,
    super.students,
  });

  factory DetailClassModel.fromJson(Map<String, dynamic> json) {
    return DetailClassModel(
      id: json['id'] as String?,
      schoolId: json['school_id'] as String?,
      academicYearId: json['academic_year_id'] as String?,
      name: json['class_name'] as String?,
      gradeLevel: json['grade_level'] as String?,
      homeroomTeacherId: json['homeroom_teacher_id'] as String?,
      capacity: json['capacity'] as int?,
      academicYear: json['academic_year'] == null
          ? null
          : AcademicYearModel.fromJson(
              json['academic_year'] as Map<String, dynamic>,
            ),
      homeroomTeacher: json['homeroom_teacher'] == null
          ? null
          : TeacherModel.fromJson(
              json['homeroom_teacher'] as Map<String, dynamic>,
            ),
      students: json['students'] == null
          ? const <StudentEntity>[]
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
      'class_name': name,
      'grade_level': gradeLevel,
      'homeroom_teacher_id': homeroomTeacherId,
      'capacity': capacity,
      'academic_year': (academicYear as AcademicYearModel?)?.toJson(),
      'homeroom_teacher': (homeroomTeacher as TeacherModel?)?.toJson(),
      'students': students.map((e) => (e as StudentModel).toJson()).toList(),
    };
  }
}

class TeacherModel extends TeacherEntity {
  const TeacherModel({
    super.id,
    super.userId,
    super.schoolId,
    super.nip,
    super.fullName,
    super.gender,
    super.birthPlace,
    super.birthDate,
    super.address,
    super.phoneNumber,
    super.photoUrl,
    super.employmentStatus,
    super.admissionDate,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      schoolId: json['school_id'] as String?,
      nip: json['nip'] as String?,
      fullName: json['full_name'] as String?,
      gender: json['gender'] as String?,
      birthPlace: json['birth_place'] as String?,
      birthDate: json['birth_date'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      photoUrl: json['photo_url'] as String?,
      employmentStatus: json['employment_status'] as String?,
      admissionDate: json['admission_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
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
