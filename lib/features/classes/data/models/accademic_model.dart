import 'package:school_app/features/classes/domain/entities/year_academic_entities.dart';

class AcademicYearModel extends AcademicYearEntity {
  const AcademicYearModel({
    super.id,
    super.schoolId,
    super.academicYearName,
    super.semester,
    super.startDate,
    super.endDate,
    required super.isActive,
    super.createdAt,
    super.updatedAt,
  });

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) {
    return AcademicYearModel(
      id: json['id'] as String,
      schoolId: json['school_id'] as String,
      academicYearName: json['academic_year_name'] as String,
      semester: json['semester'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      isActive: json['is_active'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'academic_year_name': academicYearName,
      'semester': semester,
      'start_date': startDate,
      'end_date': endDate,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
