import 'package:equatable/equatable.dart';

class AcademicYear extends Equatable {
  final String id;
  final String schoolId;
  final String academicYearName;
  final String semester;
  final String startDate;
  final String endDate;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  const AcademicYear({
    required this.id,
    required this.schoolId,
    required this.academicYearName,
    required this.semester,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) {
    return AcademicYear(
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
}
