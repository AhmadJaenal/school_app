import 'package:equatable/equatable.dart';
import 'package:school_app/features/classes/data/models/accademic_model.dart';

class ClassModel extends Equatable {
  final String id;
  final String schoolId;
  final String academicYearId;
  final String className;
  final String gradeLevel;
  final String homeroomTeacherId;
  final int capacity;
  final AcademicYear academicYear;

  const ClassModel({
    required this.id,
    required this.schoolId,
    required this.academicYearId,
    required this.className,
    required this.gradeLevel,
    required this.homeroomTeacherId,
    required this.capacity,
    required this.academicYear,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
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
  ];
}
