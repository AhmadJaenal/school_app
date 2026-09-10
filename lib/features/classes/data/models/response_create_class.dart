import 'package:equatable/equatable.dart';

class ResponseCreateClass extends Equatable {
  final String schoolId;
  final String academicYearId;
  final String className;
  final String gradeLevel;
  final String homeroomTeacherId;
  final int capacity;
  final String id;

  const ResponseCreateClass({
    required this.schoolId,
    required this.academicYearId,
    required this.className,
    required this.gradeLevel,
    required this.homeroomTeacherId,
    required this.capacity,
    required this.id,
  });

  factory ResponseCreateClass.fromJson(Map<String, dynamic> json) {
    return ResponseCreateClass(
      schoolId: json['school_id'] as String,
      academicYearId: json['academic_year_id'] as String,
      className: json['class_name'] as String,
      gradeLevel: json['grade_level'] as String,
      homeroomTeacherId: json['homeroom_teacher_id'] as String,
      capacity: json['capacity'] as int,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'school_id': schoolId,
      'academic_year_id': academicYearId,
      'class_name': className,
      'grade_level': gradeLevel,
      'homeroom_teacher_id': homeroomTeacherId,
      'capacity': capacity,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [
    schoolId,
    academicYearId,
    className,
    gradeLevel,
    homeroomTeacherId,
    capacity,
    id,
  ];
}
