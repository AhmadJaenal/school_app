import 'package:school_app/features/classes/data/models/accademic_model.dart';
import 'package:school_app/features/classes/data/models/class_detail_model.dart';
import 'package:school_app/features/classes/data/models/student_model.dart';
import 'package:school_app/features/classes/domain/entities/class_entities.dart';

class ClassModel extends ClassDetailEntity {
  const ClassModel({
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

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'] as String?,
      schoolId: json['school_id'] as String?,
      academicYearId: json['academic_year_id'] as String?,
      name: json['class_name'] as String?,
      gradeLevel: json['grade_level'] as String?,
      homeroomTeacherId: json['homeroom_teacher_id'] as String?,
      capacity: json['capacity'] as int?,
      academicYear: json['academic_year'] != null
          ? AcademicYearModel.fromJson(
              json['academic_year'] as Map<String, dynamic>,
            )
          : null,
      homeroomTeacher: json['homeroom_teacher'] != null
          ? TeacherModel.fromJson(
              json['homeroom_teacher'] as Map<String, dynamic>,
            )
          : null,
      students: json['students'] == null
          ? const []
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
      'academic_year': academicYear?.toJson(),
      'homeroom_teacher': (homeroomTeacher as TeacherModel?)?.toJson(),
      'students': students.map((e) => (e as StudentModel).toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    id,
    schoolId,
    academicYearId,
    name,
    gradeLevel,
    homeroomTeacherId,
    capacity,
    academicYear,
  ];
}
