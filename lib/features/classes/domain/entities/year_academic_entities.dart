import 'package:equatable/equatable.dart';

class AcademicYearEntity extends Equatable {
  const AcademicYearEntity({
    this.id,
    this.schoolId,
    this.academicYearName,
    this.semester,
    this.startDate,
    this.endDate,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });
  final String? id;
  final String? schoolId;
  final String? academicYearName;
  final String? semester;
  final String? startDate;
  final String? endDate;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [
    id,
    schoolId,
    academicYearName,
    semester,
    startDate,
    endDate,
    isActive,
    createdAt,
    updatedAt,
  ];

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
