import 'package:equatable/equatable.dart';

class ResponseUpdateClass extends Equatable {
  final String id;
  final String schoolId;
  final String academicYearId;
  final String className;
  final String gradeLevel;
  final String? homeroomTeacherId;
  final int capacity;

  const ResponseUpdateClass({
    required this.id,
    required this.schoolId,
    required this.academicYearId,
    required this.className,
    required this.gradeLevel,
    this.homeroomTeacherId,
    required this.capacity,
  });

  factory ResponseUpdateClass.fromJson(Map<String, dynamic> json) {
    return ResponseUpdateClass(
      id: json['id'] as String,
      schoolId: json['school_id'] as String,
      academicYearId: json['academic_year_id'] as String,
      className: json['class_name'] as String,
      gradeLevel: json['grade_level'] as String,
      homeroomTeacherId: json['homeroom_teacher_id'],
      capacity: json['capacity'] as int,
    );
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
  ];
}
