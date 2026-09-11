import 'package:school_app/features/classes/domain/entities/response_create_class_entity.dart';

class ResponseCreateClass extends ResponseCreateClassEntity {
  const ResponseCreateClass({
    super.id,
    super.schoolId,
    super.academicYearId,
    super.className,
    super.gradeLevel,
    super.homeroomTeacherId,
    super.capacity,
  });

  factory ResponseCreateClass.fromJson(Map<String, dynamic> json) {
    return ResponseCreateClass(
      id: json['id']?.toString(),
      schoolId: json['school_id']?.toString(),
      academicYearId: json['academic_year_id']?.toString(),
      className: json['class_name'] as String?,
      gradeLevel: json['grade_level'] as String?,
      homeroomTeacherId: json['homeroom_teacher_id']?.toString(),
      capacity: (json['capacity'] as num?)?.toInt(),
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
    };
  }
}
